module Services
  module Rules
    class ExcludeGroupBySelectedTeamGroup < RuleMechanism

      def process_teams(draw, groups)
        return []
      end

      def process_groups(draw, draw_rule)
        groups = draw_rule.groups
        unless draw.selected_team.nil?
          team = draw.selected_team
          team_groups = groups.select{|g| g.team_ids.include?(team.id)}

          unavailable = []
          for drum_group in draw.group_drum
            for assigned_team in drum_group.teams
              if included_in_any_group(assigned_team,team_groups)
                unavailable << [drum_group, get_explanation(draw_rule, team, assigned_team, drum_group)]
                break
              end
            end  
          end

          return unavailable
        else
          return []
        end        
      end

      def included_in_any_group(team, groups)
        return groups.map{|g| g.team_ids.include?(team.id)}.any?
      end

      def get_explanation(draw_rule, team, assigned_team, drum_group)
        short = drum_group.name+" - "+team.name+" and "+assigned_team.name 
        long = team.name+" cannot go in "+drum_group.name+" because they belong to the same "+get_group_name(draw_rule)+" as "+assigned_team.name+"."
        return UnavailableChoice.new("short_description" => short, "long_description" => long)
      end

    end
  end
end
