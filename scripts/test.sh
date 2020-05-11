#!/usr/bin/bash
rake db:migrate RAILS_ENV=test
rails db:environment:set RAILS_ENV=test
rails test
