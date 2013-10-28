desc "Custom rake task"
task :doit => :environment do
	puts 'dondidit'
end


desc 'stop rails'
task :stop do
    pid_file = 'tmp/pids/server.pid'
    pid = File.read(pid_file).to_i
    Process.kill 15, pid
    File.delete pid_file
end
