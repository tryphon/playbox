require 'rubygems'

require 'system_builder'
require 'system_builder/box_tasks'

SystemBuilder::BoxTasks.new(:playbox) do |box|
  box.disk_image do |image|
    image.size = 1024.megabytes
  end
end

desc "Run continuous integration tasks (spec, ...)"
task :ci => "playbox:buildbot"

require 'yaml'

namespace :playbox do
  task :release do
    box_name = "playbox"

    build_server = "dev.tryphon.priv"
    dist_directory = "/var/lib/buildbot/dist"

    www_server = "www.tryphon.priv"
    download_dir = "/var/www/tryphon.eu/download"

    latest = YAML.load `ssh #{build_server} cat #{dist_directory}/#{box_name}/latest.yml`
    release_name = latest["name"]

    commit = (latest["commit"] or ENV['COMMIT'])
    raise "Select a git commit with COMMIT=... (see buildbot at http://dev.tryphon.priv:8010/builders/#{box_name}/)" unless commit

    puts "Publish last release : #{release_name} (commit #{commit})"

    sh "scp '#{build_server}:#{dist_directory}/#{box_name}/#{release_name}*' #{build_server}:#{dist_directory}/#{box_name}/latest.yml #{www_server}:#{download_dir}/#{box_name}"
    sh "git tag -a #{release_name} -m 'Release #{release_name}' #{commit}"
    sh "git push --tags"
  end
end
