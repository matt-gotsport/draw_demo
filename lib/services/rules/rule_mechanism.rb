module Services
  module Rules
    class RuleMechanism < Service

      def get_group_name(draw_rule)
        return (draw_rule.group_name.nil? or draw_rule.group_name.blank?) ? "Group" : draw_rule.group_name 
      end

      def get_output_group_name(draw_rule)
        output_group_name = draw_rule.draw_definition.output_group_name 
        return (output_group_name.nil? or output_group_name.blank?) ? "Group" : output_group_name 
      end

      def get_rule_service
        return DrawRuleService.new
      end

    end
  end
end
