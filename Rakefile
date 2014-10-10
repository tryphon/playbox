require 'rubygems'

require 'system_builder'
require 'system_builder/box_tasks'

SystemBuilder::BoxTasks.multiple_architecture = true

SystemBuilder::BoxTasks.new(:playbox) do |box|
  box.architecture = :i386
end

SystemBuilder::BoxTasks.new(:playbox) do |box|
  box.architecture = :amd64
end

desc "Run continuous integration tasks (spec, ...)"
task :ci => "playbox:ci"

%w{clean dist ci}.each do |task|
  %w{i386 amd64}.each do |arch|
    task "playbox:#{task}" => "playbox:#{arch}:#{task}"
  end
end
