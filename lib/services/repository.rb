module Services
  class Repository < Service

    def copy_teams(src_group, dst_group)
      group_teams = []
      for team in src_group.teams
        group_teams<<GroupTeam.new(group: dst_group, team: team)
      end
      return group_teams    
    end

    def transaction(to_destroy_first=[], to_save=[], to_destroy_after=[])
      return ActiveRecord::Base.transaction{ to_destroy_first.map(&:destroy) + to_save.map(&:save!) + to_destroy_after.map(&:destroy)}.all?
    end

  end
end
