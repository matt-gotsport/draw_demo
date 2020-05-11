#!/usr/bin/bash
rails generate migration Add$1To$2 $3:$4
rake db:migrate db:migrate:status
