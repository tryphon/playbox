require 'rubygems'

require 'system_builder'
require 'system_builder/box_tasks'

SystemBuilder::BoxTasks.new(:playbox) do |box|
  box.disk_image do |image|
    image.size = 500.megabytes
  end
end

task :buildbot => "playbox:buildbot"
