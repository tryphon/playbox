require 'rubygems'

require 'system_builder'
require 'system_builder/box_tasks'

SystemBuilder::MultiArchBoxTasks.new(:playbox) do |box|
  if box.architecture == :i386
    box.boot.kernel_architecture = "586"
  end
end
