class MessagesController < ApplicationController
  def create
    producer = Kafka.new(seed_brokers: ['kafka:9092']).producer
    producer.produce(params[:message], topic: 'messages')
    producer.deliver_messages

    render json: { status: 'Message sent' }
  end
end