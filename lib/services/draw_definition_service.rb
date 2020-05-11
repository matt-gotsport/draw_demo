module Services
  
  class DrawDefinitionService < Service

    def create_draw_definition(draw_definition_params)
      draw_definition = DrawDefinition.new(draw_definition_params)
      draw_definition.draw_output_group_definitions = []
      for sequence in 1..draw_definition.output_group_count
        name = draw_definition.output_group_name+" "+sequence.to_s
        size = draw_definition.output_group_size 
        output_group_definition = DrawOutputGroupDefinition.new("name"=>name, "size"=>size, "sequence"=>sequence)   
        draw_definition.draw_output_group_definitions << output_group_definition
      end
      return [get_repository.transaction([],[draw_definition],[]), draw_definition] 
    end

    def create_draw_stage_sequence(draw_stage_definition)
      draw_definition = draw_stage_definition.draw_definition 
      sequence = (draw_definition.draw_stage_sequences.maximum(:sequence) || -1) + 1
      return DrawStageSequence.new(draw_definition_id: draw_definition.id, draw_stage_definition_id: draw_stage_definition.id, sequence: sequence) 
    end

    def get_draw_stage_defintions(draw_definition)
      sequences = draw_definition.draw_stage_sequences
      return (ToDrawStageDefinitions << SequenceOrder << JoinDrawStageDefinitions)[sequences] 
    end 

    def update_sequence(draw_definition, draw_stage_definition_id)
      stage = DrawStageDefinition.find(draw_stage_definition_id)
      sequence = stage.draw_stage_sequence.sequence

      if sequence != 0
        higher_sequence = ToSequence[draw_definition.draw_stage_sequences, sequence - 1]
        higher_sequence.sequence = sequence
        stage.draw_stage_sequence.sequence = sequence - 1
        return get_repository.transaction([],[higher_sequence, stage.draw_stage_sequence],[]) 
      end

      return true
    end 

  end
end
