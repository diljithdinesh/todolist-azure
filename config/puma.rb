threads_count = ENV.fetch("RAILS_MAX_THREADS") { 16 }
threads threads_count, threads_count

preload_app!
rackup      DefaultRackup
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }

on_worker_boot do
  ActiveRecord::Base.establish_connection
end

pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }
