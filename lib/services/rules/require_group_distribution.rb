module Services
  module Rules
    #require that each drum contains teams from each group
    class RequireGroupDistribution < RuleMechanism

      def process_teams(draw, groups)
        return []
      end

      def process_groups(draw, draw_rule)
        rule_groups = draw_rule.groups
        unless draw.selected_team.nil?
          
          #a team has been selected- get the groups specified by the rule  which contains the team
          team = draw.selected_team
          team_groups = rule_groups.select{|g| g.team_ids.include?(team.id)}

          #how many teams remain to be drawn from those groups
          all_team_ids = draw.get_input_team_ids()
          assigned_team_ids = draw.get_assigned_team_ids()
          unassigned_team_ids = all_team_ids.select{|id| not assigned_team_ids.include?(id)}
          supply = {}
          for team_group in team_groups
            supply[team_group.id] = team_group.teams.select{|t| unassigned_team_ids.include?(t.id)}.length
          end   

          #where are teams are needed
          demand = {}
          for team_group in team_groups
            demand[team_group.id] = {}
            for drum_group in draw.group_drum
              covered_team_ids = intersection(drum_group,team_group)
              demand[team_group.id][drum_group.id] = draw_rule.quantity - covered_team_ids.length 
            end
          end
              
          #determine which groups the selected team cannot go in
          unavailable = []
          for team_group in team_groups
            for drum_group in draw.group_drum
              in_demand = demand[team_group.id][drum_group.id] > 0
              demand_elsewhere = demand[team_group.id].select{|k,v| k!=drum_group.id}.values.reduce(:+)
              needed_elsewhere = supply[team_group.id] <= (demand_elsewhere.nil? ? 0 : demand_elsewhere)
              
              #group should not be available if selected team is not needed in that group and needed in other groups
              if not in_demand and needed_elsewhere
                unavailable << [drum_group, get_explanation(draw_rule, team, drum_group)]
              end  
            end
          end

          return unavailable
        else
          return []
        end        
      end

      def intersection(drum_group, team_group)
        return drum_group.teams.select{|t| team_group.team_ids.include?(t.id)}.map{|t| t.id}
      end

      def included_in_any_group(team, groups)
        return groups.map{|g| g.team_ids.include?(team.id)}.any?
      end

      def get_explanation(draw_rule, team, drum_group)
        short = drum_group.name+" - "+team.name+" needed elsewhere."
        long = team.name+" cannot go in "+drum_group.name+" because another "+get_output_group_name(draw_rule)+" needs teams from their "+get_group_name(draw_rule)+"."
        return UnavailableChoice.new("short_description" => short, "long_description" => long)
      end

    end
  end
end
