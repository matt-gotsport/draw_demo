#!/usr/bin/bash
rake db:drop db:create db:migrate db:migrate:status
