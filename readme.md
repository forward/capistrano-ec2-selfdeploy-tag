Capistrano EC2 Selfdeploy Tag
====================================================

capistrano-ec2-selfdeploy-tag is used to replace a specific Git tag with whichever codebase was just successfully deployed. This same tag is then used alongside another system, in order to deploy the latest production code to a newly autoscaled EC2 instance.

The autoscale deployment system is not provided by this Gem.

Installing

    gem install capistrano-ec2-selfdeploy-tag

In your deploy.rb:

    require 'capistrano/ec2/selfdeploy/tag'

Now when you run a standard cap deploy, upon success you will see output similar to this:

    Recreating Git selfdeploy tag 'inproduction'...

Overriding Defaults
====================================================

By default, capistrano-ec2-selfdeploy-tag will use the Git tag 'inproduction'. You can use a different tag if you like.
Put this in your deploy.rb:

    set :selfdeploy_tag, "your_tag_name"

You can also decide to skip recreating the tag for specific deploy tasks. To do so, put this in your deploy.rb:

    set :update_selfdeploy_tag, false