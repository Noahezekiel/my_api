
# threads. This includes Active Record's `pool` parameter in `database.yml`.
threads_count = ENV.fetch("RAILS_MAX_THREADS", 3).to_i
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port ENV.fetch("PORT", "3000").to_i

# Allow puma to be restarted by `bin/rails restart` command.
plugin :tmp_restart

# Run the Solid Queue supervisor inside of Puma for single-server deployments
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
# port ENV.fetch("PORT") { 10000 }

workers ENV.fetch("WEB_CONCURRENCY", 1).to_i if ENV["WEB_CONCURRENCY"]
preload_app!

on_worker_boot do
    ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end
  


