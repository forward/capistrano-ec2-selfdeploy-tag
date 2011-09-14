# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "capistrano-ec2-selfdeploy-tag"
  s.version     = "1.0.2.pre"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Conway"]
  s.email       = ["ryan.conway@forward.co.uk"]
  s.homepage    = "http://github.com/forward/capistrano-ec2-selfdeploy-tag"
  s.summary     = %q{Recreates a specified Git tag every time you deploy, with whatever codebase just got pushed live. This tag is used alongside another system, to deploy the latest production code to a newly autoscaled instance.}
  s.description = %q{Recreates a specified Git tag every time you deploy, with whatever codebase just got pushed live. This tag is used alongside another system, to deploy the latest production code to a newly autoscaled instance.}

  s.rubyforge_project = "capistrano-ec2-selfdeploy-tag"

  s.files = ["lib/capistrano/ec2/selfdeploy/tag.rb"]
  s.require_paths = ["lib"]
  
  s.add_dependency("capistrano", [">= 1.0.0"])
  s.has_rdoc = false
end