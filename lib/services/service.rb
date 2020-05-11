module Services
  class Service
    
    JoinDrawSteps = -> draw_step_sequences { draw_step_sequences.joins(:draw_step) }
    JoinGroupTeams = -> groups { groups.joins(:group_team) }
    JoinGroups = -> draw_output_groups { draw_output_groups.joins(:group) }
    JoinDrawStageDefinitions = ->(draw_stage_sequences) { draw_stage_sequences.joins(:draw_stage_definition) }
    
    ToSequence = -> sequences,sequence { sequences.select{|seq| seq.sequence==sequence}.first } 
    ToDrawSteps = -> draw_step_sequences { draw_step_sequences.map{ |s| s.draw_step } }
    ToDrawStageDefinitions = -> draw_stage_sequences { draw_stage_sequences.map{ |s| s.draw_stage_definition } }

    SequenceOrder = -> rows { rows.order("sequence ASC") }     
    CreatedOrder = -> rows { rows.order("created_at DESC") }     

    def get_repository
      return Repository.new
    end

  end
end
