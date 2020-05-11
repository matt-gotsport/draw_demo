module Services
  module Steps
    class LoadTeamDrum < StepMechanism
    
       def process(draw, team_id, group_id, sequence)
         to_destroy = []
         to_save = [draw]
         to_destroy_after = []

         group_teams = draw.current_stage.group.group_teams  
         drum_teams = draw.current_stage.input_teams.map{|team| DrumTeam.new(draw: draw,team: team)}
         to_destroy += group_teams
         to_save += drum_teams

         save,destroy_after = advance_step(draw)
         to_save += save
         to_destroy_after += destroy_after

         return [get_repository.transaction(to_destroy, to_save, to_destroy_after), "Step Complete."]
       end

       def undo(draw)
         to_destroy = []
         to_save = [draw]
         to_destroy_after = []

         stage_group = draw.current_stage.draw_stage_definition.group 
         input_group = draw.current_stage.input_group
         group_teams = get_repository.copy_teams(stage_group, input_group)
         drum_teams = stage_group.teams.map{|team| DrumTeam.find_by(team_id: team.id)}.compact
         to_destroy += drum_teams
         to_save += group_teams
          
         save,destroy_after,prev_step = decrease_step(draw)
         to_save += save
         to_destroy_after += destroy_after

         return [get_repository.transaction(to_destroy, to_save, to_destroy_after), "Step undone."]
       end

    end
  end
end
