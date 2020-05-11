module Services
  module Steps
    class SelectTeamAndAssign < StepMechanism
    
       def process(draw, team_id, group_id, sequence)
         to_destroy = []
         to_save = [draw]
         to_destroy_after = []

         unless team_id.nil?
            draw.set_selected_team(Team.find(team_id))
            message = "Team selected"
         else
            team = draw.selected_team 
            unless team.nil?
              to_save << GroupTeam.new(group_id: group_id, team_id: team.id, sequence: sequence)
              to_destroy << draw.drum_teams.find_by!(team_id: team.id)

              save,destroy_after = advance_step(draw)
              to_save += save
              to_destroy_after += destroy_after

              message = "Step complete"
            else
              message = "Please select a team first."
            end
         end

         return [get_repository.transaction(to_destroy, to_save, to_destroy_after), message]
       end

       def undo(draw)
         to_destroy = []
         to_save = [draw]
         to_destroy_after = []
         
         group_team = get_last_assigned_group_team(draw)

         if draw.selected_team.nil? or draw.selected_team.id == group_team.nil? ? nil : group_team.id
           to_save << DrumTeam.new(draw: draw, team: group_team.team)
           to_destroy << group_team
           
           save,destroy_after,prev_step = decrease_step(draw)
           to_save += save
           to_destroy_after += destroy_after

           message = "Step undone"
         else
            draw.set_selected_team(nil)
            message = "Selection undone."
         end

         return [get_repository.transaction(to_destroy, to_save, to_destroy_after), message]
       end

    end
  end
end
