module Services
  module Steps
    class LoadGroupDrum < StepMechanism
    
       def process(draw, team_id, group_id, sequence)
         to_destroy = []
         to_save = [draw]
         to_destroy_after = []

         step_groups = get_step_service.get_step_groups(draw) 
         drum_groups = step_groups.map{|group| DrumGroup.new(draw: draw, group: group)}
         to_save += drum_groups

         save,destroy_after = advance_step(draw)
         to_save += save
         to_destroy_after += destroy_after

         return [get_repository.transaction(to_destroy, to_save, to_destroy_after), "Step Complete."]
       end

       def undo(draw)
         to_destroy = []
         to_save = [draw]
         to_destroy_after = []

         to_destroy += draw.drum_groups
          
         save,destroy_after,prev_step = decrease_step(draw)
         to_save += save
         to_destroy_after += destroy_after

         return [get_repository.transaction(to_destroy, to_save, to_destroy_after), "Step undone."]
       end

    end
  end
end
