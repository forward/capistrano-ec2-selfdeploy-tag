Capistrano::Configuration.instance(:must_exist).load do

  namespace :ec2 do
    namespace :selfdeploy do
      namespace :tag do
        desc "Replace a specific Git tag with whatever just got deployed for use with EC2 self deploy."

        task :update_tag do
          update_tag = fetch(:update_selfdeploy_tag) rescue true
          tag_name = fetch(:selfdeploy_tag) rescue "inproduction"

          if update_tag
            puts "Recreating Git selfdeploy tag '#{tag_name}'..."

            user = `git config --get user.name`
            email = `git config --get user.email`

            puts `git tag -d #{tag_name}`
            puts `git push origin :#{tag_name}`
            puts `git tag #{tag_name} #{revision} -m "Selfdeploy tag recreated by #{user} <#{email}>"`
            puts `git push --tags`
          else
            puts "This is a self deployment task - not recreating selfdeploy tag..."
            exit 1
          end
        end
      end
    end
  end
  
  namespace :deploy do
    after "deploy", "ec2:selfdeploy:tag:update_tag"
  end
  
  task :ec2_instance do
    # The EC2 autoscale self deploy tool calls 'bundle exec cap ec2_instance deploy' to trigger this.
    # We set 'update_selfdeploy_tag' to false so the selfdeploy_tag isn't altered during autoscaling.
    # We also override the branch to deploy from to be the selfdeploy_tag.
    
    set :deploy_via, :export # Git + capistrano don't like switching to a tag from master
    set :update_selfdeploy_tag, false
    
    tag_name = fetch(:selfdeploy_tag) rescue "inproduction"
    set :branch, tag_name
  end

end