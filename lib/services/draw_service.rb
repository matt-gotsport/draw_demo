module Services
  
  class DrawService < Service 

    def get_complete_draw_definitions
      complete_draw_definitions = []
      for draw_definition in DrawDefinition.all
        if draw_stage_sequence = ToSequence[draw_definition.draw_stage_sequences,0]
          if ToSequence[draw_stage_sequence.draw_stage_definition.draw_step_sequences,0]
            complete_draw_definitions<<draw_definition
          end
        end  
      end
      return complete_draw_definitions
    end

    def create_draw(draw_definition_id)
      draw_definition = DrawDefinition.find(draw_definition_id) 
      
      first_stage = get_step_service.create_next_draw_stage(draw_definition)
      first_stage.input_group.group_teams = get_step_service.copy_input_group_teams(first_stage.draw_stage_definition,first_stage.input_group)  
      
      draw = Draw.new(draw_definition: draw_definition, draw_stage: first_stage)
      draw.draw_output_groups = self.create_output_groups(draw)
      
      success = get_repository.transaction([],[first_stage, draw],[])
      
      return [success, draw]
    end

    def create_output_groups(draw)
      output_groups = []
      for definition in draw.draw_definition.draw_output_group_definitions 
        output_group = Group.new(name: definition.name, draw_definition: draw.draw_definition)
        output_groups<<DrawOutputGroup.new(group: output_group, size: definition.size, draw_output_group_definition: definition)
      end
      return output_groups 
    end

    def get_step_service
      return DrawStepService.new
    end

  end
end
