#!/bin/bash
heroku pg:psql --app aiko-mk2 DATABASE -c "SELECT user_name FROM admin_users WHERE mid = '$1';"
