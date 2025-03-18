threads_count = ENV.fetch("RAILS_MAX_THREADS", 3).to_i
threads threads_count, threads_count

port ENV.fetch("PORT", 3000).to_i

plugin :tmp_restart

# Run the Solid Queue supervisor inside of Puma for single-server deployments
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

pidfile ENV["PIDFILE"] if ENV["PIDFILE"]

# Workers configuration (DISABLED FOR WINDOWS)
unless Gem.win_platform?
  workers ENV.fetch("WEB_CONCURRENCY", 1).to_i
  preload_app!

  on_worker_boot do
    ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
  end
end
