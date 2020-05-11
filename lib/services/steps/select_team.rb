module Services
  module Steps
    class SelectTeam < StepMechanism
    
       def process(draw, team_id, group_id, sequence)
         to_destroy = []
         to_save = [draw]
         to_destroy_after = []

         unless team_id.nil?
           draw.set_selected_team(Team.find(team_id))

           save,destroy_after = advance_step(draw)
           to_save += save
           to_destroy_after += destroy_after
           
           message = "Team selected"
         else
           message = "Please select a team."
         end

         return [get_repository.transaction(to_destroy, to_save, to_destroy_after), message]
       end

       def undo(draw)
         to_destroy = []
         to_save = [draw]
         to_destroy_after = []

         group_team = get_last_assigned_group_team(draw)
         draw.set_selected_team(group_team.nil? ? nil : group_team.team)

         save,destroy_after,prev_step = decrease_step(draw)
         to_save += save
         to_destroy_after += destroy_after

         message = "Selection undone."

         return [get_repository.transaction(to_destroy, to_save, to_destroy_after), message]
       end

    end
  end
end
