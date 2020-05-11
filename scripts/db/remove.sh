#!/usr/bin/bash
rails generate migration Remove$1From$2 $3:$4
rake db:migrate db:migrate:status
