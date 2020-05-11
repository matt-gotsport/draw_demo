module Services
  class DrawRuleService < Service 

    def apply_team_rules(draw)
      drum_teams = draw.drum_teams.map{|dt| dt.team}
      unavailable = []

      for rule in draw.current_stage.current_step.draw_rules
        rule_mechanism = get_rule_mechanism(rule)
        unavailable += rule_mechanism.process_teams(draw, rule)  
      end

      unavailable_ids = unavailable.map{|t| t.first.id}
      available = drum_teams.select{|t| !unavailable_ids.include?(t.id)}

      return [available,unavailable]
    end

    def apply_group_rules(draw)
      drum_groups = draw.drum_groups.map{|dt| dt.group}
      unavailable = []

      for rule in draw.current_stage.current_step.draw_rules
        rule_mechanism = get_rule_mechanism(rule)
        unavailable += rule_mechanism.process_groups(draw, rule)  
      end

      unavailable_ids = unavailable.map{|g| g.first.id}
      available = drum_groups.select{|g| !unavailable_ids.include?(g.id)}

      return [available,unavailable] 
    end

    def update_rule_steps(draw_rule, draw_stage_definition_id, draw_step_ids)
      draw_stage_definition = DrawStageDefinition.find(draw_stage_definition_id)
      new_steps = draw_step_ids.filter_map{|id| DrawStep.find(id) if DrawStep.exists?(id)}
      old_rule_steps = draw_rule.rule_steps.filter{|rs| rs.draw_step.draw_stage_definition_id == draw_stage_definition.id} 
      rule_steps = new_steps.map{|s| RuleStep.new(draw_rule:draw_rule, draw_step:s)}
      return get_repository.transaction(old_rule_steps,rule_steps)
    end
    
    def update_rule_groups(draw_rule, group_ids)
      new_groups = group_ids.filter_map{|id| Group.find(id) if Group.exists?(id)}
      old_rule_groups = draw_rule.rule_groups.filter{|rg| rg.draw_rule.id == draw_rule.id} 
      rule_groups = new_groups.map{|g| RuleGroup.new(draw_rule:draw_rule, group:g)}
      return get_repository.transaction(old_rule_groups,rule_groups)    
    end

    def get_rule_mechanism(draw_rule)
      return RuleMap[draw_rule.draw_rule_variety.variety].new 
    end

    RuleMap = {
      "RequireTeamHaveSelectedTeamGroup" => Rules::RequireTeamHaveSelectedTeamGroup,
      "ExcludeGroupBySelectedTeamGroup" => Rules::ExcludeGroupBySelectedTeamGroup,
      "RequireGroupDistribution" => Rules::RequireGroupDistribution
    }

  end
end
