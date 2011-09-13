## 1.0.1 (September 13, 2011)

Bugfixes:

  - When ':update_selfdeploy_tag' is set to false, we no longer exit with a status of 1.

## 1.0.0 (June 13, 2011)

Features:

  - Running a standard 'cap deploy' will move the 'inproduction' tag to whatever commit was just deployed.
  - You can 'set :selfdeploy_tag, "your_tag_name"' to change the tag name used.
  - You can prevent the tag from being moved for specific tasks by using 'set :update_selfdeploy_tag, false'.
  - Running 'cap ec2_instance deploy' ensures the deployment takes place from the 'inproduction' tag and prevents the tag from being moved. Use this task with your autoscaling self deployments.