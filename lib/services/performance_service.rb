module Services
  class PerformanceService < Service

    def process_step(draw, team_id, group_id, sequence)
      step_mechanism = get_next_step_mechanism(draw)
      unless step_mechanism.nil?
        return step_mechanism.process(draw, team_id, group_id, sequence)
      else
        return [true,"No more Steps in Draw."]
      end
    end

    def undo_step(draw)
      step_mechanism = get_prev_step_mechanism(draw)
      unless step_mechanism.nil?
        return step_mechanism.undo(draw)
      else
        return [true,"No more Steps to Undo."]
      end
    end

    def get_team_assignment_map(draw)
      assigned_teams = draw.groups.map{|group| [group.id,{}]}.to_h
      for group_team in draw.group_teams
        assigned_teams[group_team.group_id][group_team.sequence] = group_team.team
      end
      return assigned_teams
    end

    def apply_team_rules(draw)
      return get_rule_service.apply_team_rules(draw)
    end 

    def apply_group_rules(draw)
      return get_rule_service.apply_group_rules(draw)
    end 

    def get_next_step_mechanism(draw)
      draw_stage_definition = draw.current_stage.draw_stage_definition
      draw_step = draw.current_stage.current_step
      next_step = get_step_service.get_next_draw_step(draw_stage_definition, draw_step)
      
      if next_step.nil?
        next_stage_definition = get_step_service.get_next_draw_stage_defintion(draw.draw_definition, draw.current_stage)
        unless next_stage_definition.nil?
          next_step = get_step_service.get_first_draw_step(next_stage_definition)
        end
      end
      return next_step.nil? ? nil : get_step_mechanism(draw.current_stage.current_step) 
    end

    def get_prev_step_mechanism(draw)
      draw_stage_definition = draw.current_stage.draw_stage_definition
      draw_step = draw.current_stage.current_step
      prev_step = get_step_service.get_prev_draw_step(draw_stage_definition, draw_step)
      
      if prev_step.nil?
        prev_stage_definition = get_step_service.get_prev_draw_stage_defintion(draw.draw_definition, draw.current_stage)
        unless prev_stage_definition.nil?
          prev_step = get_step_service.get_last_draw_step(prev_stage_definition)
        end
      end
      return prev_step.nil? ? nil : get_step_mechanism(prev_step) 
    end

    def get_step_mechanism(draw_step)
      return StepMap[draw_step.draw_step_variety.variety].new 
    end

    StepMap = {
      "LoadTeamDrum" => Steps::LoadTeamDrum,
      "LoadGroupDrum" => Steps::LoadGroupDrum,
      "SelectTeam" => Steps::SelectTeam,
      "SelectTeamAndAssign" => Steps::SelectTeamAndAssign,
      "AssignTeamToGroup" => Steps::AssignTeamToGroup,
      "CompleteDraw" => Steps::CompleteDraw
    }

    def get_step_service
      return DrawStepService.new
    end

    def get_rule_service
      return DrawRuleService.new
    end

  end
end
