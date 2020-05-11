#!/usr/bin/bash

#source new.sh
#bundle install
#yarn add bootstrap@3.4.1 jquery popper.js

#rails destroy scaffold Group
#rails generate scaffold Group draw_definition:references name:string image_file:string  

#source ./scripts/creation/01_initial.sh
#rails generate migration RemoveGroupDefinitionFromGroup group_definition_id:integer
#rails generate migration DropGroupDefinitionsTable
#rails generate migration AddNameToGroup name:string
#rails generate migration AddImageFileToGroup image_file:string
#rails generate migration rename draw_rule_type
#rails generate migration ChangeForeignKeyForDrawRule
#rails generate migration ChangeForeignKeyForDrawStep
#rails generate migration RenameDrawStepTypeForDrawStep
#rails generate migration RenameDrawRuleTypeForDrawRule
#rails generate migration RenameTypeForDrawStepVariety
#rails generate migration RenameTypeForDrawRuleVariety
#rails generate migration CreateGroup draw_definition:references name:string image_file:string  
#rails generate migration DropDrawStageSequencesTable
#rails generate migration CreateDrawStageSequence draw_definition:references draw_stage_definition:references sequence:integer
#rails generate migration RemoveDrawDefinitionFromDrawStep draw_definition_id:integer
#rails generate migration AddDrawStageDefinitionToDrawStep draw_stage_definition_id:integer
#rails generate migration RenameDrawStageDefinitionForDrawStep
#rails generate migration AddOutputGroupPropertiesToDrawDefinition output_group_name:string output_group_count:integer output_group_size:integer
#rails generate scaffold DrawOutputGroup size:integer   
#rails generate migration AddTeamToDraw team:references
#rails generate migration AddSequenceToGroupTeam sequence:integer
#rails generate scaffold DrawHistory draw:references group_team:references   
#rails destroy scaffold DrawHistory draw:references group_team:references   
#rails generate migration DropDrawHistoryTable
#rails generate migration AddTimestampsToGroupTeamTable
#rails generate migration AddAllowFreeSelectionToDrawStepVariety allow_free_selection:boolean
#rails generate migration CreateDrawOutputGroupDefinition draw_definition:references name:string size:integer
#rails generate migration AddDrawOutputGroupDefinitionToDrawOutputGroup draw_output_group_definition:references
#rails generate migration RemoveOutputGroupPropertiesFromDrawDefinition output_group_name:string output_group_count:integer output_group_size:integer
#rails generate migration ChangeForeignKeyForGroup
#rails generate migration AddSequencetoDrawOutputGroupDefinition sequence:integer
#rails generate scaffold_controller OutputGroupDefinition draw_definition:references name:string size:integer sequence:integer
#rails generate migration CreateStepGroup draw_step:references draw_output_group_definition:references
#rails generate migration AddAllowSelectionsToDrawStepVariety allow_team_selection:boolean allow_group_selection:boolean 

#source ./scripts/db/migrate.sh
#rake db:rollback
#rake db:migrate VERSION=20200330192313
#source ./scripts/db/rollback.sh
#source ./scripts/db/nuke.sh
#rake db:seed
#rake db:migrate:status
#rake routes
#rake assets:clobber

source ./scripts/run.sh
#source ./scripts/chill.sh

#rails db:environment:set RAILS_ENV=test
#rake db:drop db:create RAILS_ENV=test
#rake db:migrate RAILS_ENV=test
#rails test

chmod -R 777 *
echo DONE
