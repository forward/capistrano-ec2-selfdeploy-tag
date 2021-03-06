## 1.0.3 (November 16, 2011)

Bugfix:

  - Suddenly started failing on a subset of servers, related to not requiring rubygems or capistrano.

## 1.0.2 (September 14, 2011)

  - Added a dummy 'deploy:first_time' task. Override this task in your project if there are commands that need to be run the first time a project deploys, but not during each subsequent deploy.

## 1.0.1 (September 13, 2011)

Bugfixes:

  - When ':update_selfdeploy_tag' is set to false, we no longer exit with a status of 1.

## 1.0.0 (June 13, 2011)

Features:

  - Running a standard 'cap deploy' will move the 'inproduction' tag to whatever commit was just deployed.
  - You can 'set :selfdeploy_tag, "your_tag_name"' to change the tag name used.
  - You can prevent the tag from being moved for specific tasks by using 'set :update_selfdeploy_tag, false'.
  - Running 'cap ec2_instance deploy' ensures the deployment takes place from the 'inproduction' tag and prevents the tag from being moved. Use this task with your autoscaling self deployments.