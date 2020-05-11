module Services
  module Steps
    class AssignTeamToGroup < StepMechanism
    
       def process(draw, team_id, group_id, sequence)
         to_destroy = []
         to_save = [draw]
         to_destroy_after = []

         team = draw.selected_team 
         unless team.nil?

           if group_id.nil?
             return [true, "Please select a "+draw.draw_definition.output_group_name+"."]
           end 

           drum_group = draw.drum_groups.find_by!(group_id: group_id) 
           sequences = [0] + draw.group_teams.filter_map{|gt| gt.sequence if gt.group_id==group_id.to_i}
           sequence = sequences.max() + 1

           to_save << GroupTeam.new(group_id: group_id, team_id: team.id, sequence: sequence)
           to_destroy << drum_group
           to_destroy << draw.drum_teams.find_by!(team_id: team.id)

           save,destroy_after = advance_step(draw)
           to_save += save
           to_destroy_after += destroy_after
           
           message = "Assigned " + team.name + " to " + drum_group.group.name
         else
           message = "Cannot process step- Team not selected."
         end

         return [get_repository.transaction(to_destroy, to_save, to_destroy_after), message]
       end

       def undo(draw)
         to_destroy = []
         to_save = [draw]
         to_destroy_after = []
      
         group_team = get_last_assigned_group_team(draw)            
         draw.set_selected_team(group_team.team)
         to_save << DrumGroup.new(draw: draw, group: group_team.group)
         to_save << DrumTeam.new(draw: draw, team: group_team.team)
         to_destroy << group_team

         save,destroy_after,prev_step = decrease_step(draw)
         to_save += save
         to_destroy_after += destroy_after

         message = "Selection undone."

         return [get_repository.transaction(to_destroy, to_save, to_destroy_after), message]
       end

    end
  end
end
