module Services
  module Rules
    class RequireTeamHaveSelectedTeamGroup < RuleMechanism

      def process_teams(draw, draw_rule)
        groups = draw_rule.groups
        unless draw.selected_team.nil?
          team = draw.selected_team
          team_groups = groups.select{|g| g.team_ids.include?(team.id)}
          
          unavailable = []
          for drum_team in draw.team_drum
            unless included_in_groups(drum_team,team_groups)
              unavailable << [drum_team, get_explanation(draw_rule, team, drum_team)]
            end
            puts unavailable.length
          end

          puts unavailable.length
          return unavailable
        else
          return []
        end
      end

      def process_groups(draw, groups)
        return []
      end

      def included_in_groups(team,groups)
        return groups.map{|g| g.team_ids.include?(team.id)}.all?
      end

      def get_explanation(draw_rule, team, drum_team)
        short = drum_team.name+" - "+team.name
        long = drum_team.name + " does not belong to same " + get_group_name(draw_rule) + "(s) as " + team.name + "."
        return UnavailableChoice.new("short_description" => short, "long_description" => long)
      end

    end
  end
end
