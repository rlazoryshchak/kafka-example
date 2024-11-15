Dir[Rails.root.join('app', 'jobs', '**', '*.rb')].each { |file| require file }

Thread.new do
  MessageConsumerJob.new.perform
end
