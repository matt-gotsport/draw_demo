module Services
  module Steps
    class StepMechanism < Service

      def advance_step(draw)
        to_destroy = []
        next_step = get_step_service.get_next_draw_step(draw.current_stage.draw_stage_definition, draw.current_stage.current_step)

        #could not get next step in stage- advance stage
        if next_step.nil?
          
          #go on to next stage by building it
          next_stage = get_step_service.create_next_draw_stage(draw.draw_definition, draw.current_stage)
          
          unless next_stage.nil?
            next_stage.input_group.group_teams = get_step_service.copy_input_group_teams(next_stage.draw_stage_definition,next_stage.input_group)  
            next_step = get_step_service.get_first_draw_step(next_stage.draw_stage_definition)
           
            to_destroy<<draw.current_stage
            draw.set_current_stage(next_stage)
            draw.current_stage.set_current_step(next_step)
          end
        else
          draw.current_stage.set_current_step(next_step)
        end
        
        return [[draw.current_stage, draw.current_stage.input_group], to_destroy]  
      end

      def decrease_step(draw)
        to_destroy = []
        prev_step = get_step_service.get_prev_draw_step(draw.current_stage.draw_stage_definition, draw.current_stage.current_step)

        #could not get prev step in stage- decrease stage
        if prev_step.nil?
          
          #go back to prev stage by building it
          prev_stage = get_step_service.create_prev_draw_stage(draw.draw_definition, draw.current_stage)
          
          unless prev_stage.nil?
            to_destroy += draw.current_stage.input_group.group_teams
            to_destroy<<draw.current_stage
            prev_step = get_step_service.get_last_draw_step(prev_stage.draw_stage_definition)
          
            draw.set_current_stage(prev_stage)
            draw.current_stage.set_current_step(prev_step)
          end
        else
          draw.current_stage.set_current_step(prev_step)
        end
        
        return [[draw.current_stage], to_destroy]  
      end

      def get_last_assigned_group_team(draw)
        return CreatedOrder[draw.group_teams].first            
      end

      def get_step_service
        return DrawStepService.new
      end

    end
  end
end
