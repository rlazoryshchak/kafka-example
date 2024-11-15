class MessageConsumerJob < ApplicationJob
  queue_as :default

  def perform
    kafka = Kafka.new(['kafka:9092'], client_id: 'consumer_service')
    consumer = kafka.consumer(group_id: 'message_consumers')
    consumer.subscribe('messages')

    consumer.each_message do |message|
      Rails.logger.info "Consumed message: #{message.value}"
    end
  end
end