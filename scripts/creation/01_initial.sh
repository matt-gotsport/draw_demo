#!/usr/bin/bash

rails generate scaffold Team name:string image_file:string
rails generate scaffold DrawDefinition name 
rails generate scaffold DrawStepType description:string type:string
rails generate scaffold DrawRuleType description:string type:string

rails generate scaffold Group draw_definition:references name:string image_file:string  
rails generate migration CreateGroupTeam group:references team:references


rails generate scaffold DrawStageDefinition draw_definition:references name:string group:references 
rails generate migration CreateDrawStageSequence draw_definition:references draw_stage_definition:references sequence:integer
rails generate scaffold DrawStage draw_stage_definition:references draw_step:references group:references

rails generate scaffold DrawStep draw_stage_definition:references draw_step_type:references
rails generate migration CreateDrawStepSequence draw_stage_definition:references draw_step:references sequence:integer

rails generate scaffold DrawRule draw_definition:references draw_rule_type:references
rails generate migration CreateRuleGroup draw_rule:references group:references
rails generate migration CreateRuleStep draw_rule:references draw_step:references

rails generate scaffold Draw draw_definition:references draw_stage:references

rails generate migration CreateDrumTeam draw:references team:references
rails generate migration CreateDrumGroup draw:references group:references
rails generate migration CreateDrawOutputGroup draw:references group:references size:integer 
