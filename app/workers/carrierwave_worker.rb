class CarrierwaveWorker
	include Sidekiq::Worker
	# sidekiq_options retry: false
end