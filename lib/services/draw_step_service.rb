module Services
  class DrawStepService < Service
    
    def create_draw_step_sequence(draw_step)
      draw_stage_definition = draw_step.draw_stage_definition
      sequence = (draw_stage_definition.draw_step_sequences.maximum(:sequence) || -1) + 1
      return DrawStepSequence.new(draw_stage_definition_id: draw_stage_definition.id, draw_step_id: draw_step.id, sequence: sequence) 
    end

    def get_draw_steps(draw_stage_definition)
      sequences = draw_stage_definition.draw_step_sequences
      return (ToDrawSteps << SequenceOrder << JoinDrawSteps)[sequences] 
    end 

    def update_sequence(draw_stage_definition, draw_step_id)
      step = DrawStep.find(draw_step_id)
      sequence = step.draw_step_sequence.sequence
      if sequence != get_first_sequence(draw_stage_definition)
        higher_sequence = ToSequence[draw_stage_definition.draw_step_sequences, sequence - 1]
        higher_sequence.sequence = sequence
        step.draw_step_sequence.sequence = sequence - 1
        return get_repository.transaction([],[higher_sequence,step.draw_step_sequence]) 
      end
    end

    def update_step_groups(draw_step, draw_output_group_definition_ids)
      definitions = draw_output_group_definition_ids.filter_map{|id| DrawOutputGroupDefinition.find(id) if DrawOutputGroupDefinition.exists?(id)}
      step_groups = definitions.map{|definition| StepGroup.new(draw_step: draw_step, draw_output_group_definition: definition)}
      return get_repository.transaction(draw_step.step_groups, step_groups)   
    end

    def get_step_groups(draw)
      output_groups = draw.draw_output_groups
      current_step = draw.current_stage.current_step
      definition_ids = current_step.draw_output_group_definition_ids
      return output_groups.filter_map{|og| og.group if definition_ids.include?(og.draw_output_group_definition.id)}
    end

    def create_next_draw_stage(draw_definition, draw_stage=nil)
      draw_stage_definition = get_next_draw_stage_defintion(draw_definition, draw_stage)
      return draw_stage_definition.nil? ? nil : self.create_draw_stage(draw_stage_definition)
    end

    def create_prev_draw_stage(draw_definition, draw_stage)
      draw_stage_definition = get_prev_draw_stage_defintion(draw_definition, draw_stage)
      return draw_stage_definition.nil? ? nil : self.create_draw_stage(draw_stage_definition)
    end

    def get_next_draw_stage_defintion(draw_definition, draw_stage=nil)
      return get_draw_stage_defintion(draw_definition, draw_stage, 1)
    end

    def get_next_draw_step(draw_stage_definition, draw_step=nil)
      return get_draw_step(draw_stage_definition, draw_step, 1)
    end

    def get_prev_draw_stage_defintion(draw_definition, draw_stage)
      return get_draw_stage_defintion(draw_definition, draw_stage, -1)
    end

    def get_prev_draw_step(draw_stage_definition, draw_step)
      return get_draw_step(draw_stage_definition, draw_step, -1)
    end

    def get_first_sequence(draw_stage_definition)
      first_step = get_first_draw_step(draw_stage_definition)
      return first_step.nil? ? 0 : first_step.draw_step_sequence.sequence    
    end

    def get_first_draw_step(draw_stage_definition)
      sequence = SequenceOrder[draw_stage_definition.draw_step_sequences].first
      return sequence.nil? ? nil : sequence.draw_step
    end

    def get_last_draw_step(draw_stage_definition)
      sequence = SequenceOrder[draw_stage_definition.draw_step_sequences].last
      return sequence.nil? ? nil : sequence.draw_step
    end

    def get_draw_stage_defintion(draw_definition, draw_stage=nil, sequence_delta)
      sequence = draw_stage.nil? ? 0 : draw_stage.draw_stage_definition.draw_stage_sequence.sequence + sequence_delta 
      draw_stage_sequence = ToSequence[draw_definition.draw_stage_sequences,sequence]
      return draw_stage_sequence.nil? ? nil : draw_stage_sequence.draw_stage_definition
    end

    def get_draw_step(draw_stage_definition, draw_step=nil, sequence_delta)
      sequence = (draw_step.nil? ? 0 : draw_step.draw_step_sequence.sequence) + sequence_delta 
      draw_sequence = ToSequence[draw_stage_definition.draw_step_sequences,sequence]
      return draw_sequence.nil? ? nil : draw_sequence.draw_step
    end

    def create_draw_stage(draw_stage_definition)
      first_draw_step =  get_first_draw_step(draw_stage_definition)
      input_group = self.create_input_group(draw_stage_definition)
      return DrawStage.new(draw_stage_definition: draw_stage_definition, draw_step: first_draw_step, group: input_group) 
    end
     
    def create_input_group(draw_stage_definition)
      input_group = Group.new(name: draw_stage_definition.name+" Input Group", draw_definition: draw_stage_definition.draw_definition)
      return input_group 
    end

    def copy_input_group_teams(draw_stage_definition, input_group)
      return get_repository.copy_teams(draw_stage_definition.group, input_group)
    end

  end
end
