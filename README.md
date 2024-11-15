# Kafka Microservices with Producer and Consumer

This project sets up a local development environment for a Kafka-based message pipeline using Docker Compose. It includes a Kafka and Zookeeper setup, alongside two microservices: `producer_service` and `consumer_service`. The producer service sends messages to Kafka, while the consumer service listens to and logs these messages.

## Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## Services Overview

- **Kafka**: Acts as the messaging broker.
- **Zookeeper**: Manages the Kafka cluster.
- **Producer Service**: Sends messages to the Kafka topic.
- **Consumer Service**: Consumes and logs messages from the Kafka topic.

## Setup

1. Clone the repository and navigate to the project folder.
2. Build and run the Docker Compose configuration:

   ```bash
   docker-compose up

## Run
1. Run in command line
   ```bash
   curl -X POST http://localhost:3001/messages -d "message=Hello Kafka"
2. Observe consumer_service logs
   ```bash
   producer_service-1  | Started POST "/messages" for 192.168.65.1 at 2024-11-15 08:35:12 +0000
   producer_service-1  |    (1.9ms)  CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY)
   producer_service-1  |    (0.1ms)  CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL)
   producer_service-1  |   ActiveRecord::SchemaMigration Load (0.1ms)  SELECT "schema_migrations"."version" FROM "schema_migrations" ORDER BY "schema_migrations"."version" ASC
   producer_service-1  | Processing by MessagesController#create as */*
   producer_service-1  |   Parameters: {"message"=>"Hello Kafka"}
   producer_service-1  | Completed 200 OK in 22ms (Views: 0.3ms | ActiveRecord: 0.0ms (0 queries, 0 cached) | GC: 0.1ms)
   producer_service-1  |
   producer_service-1  |
   consumer_service-1  | Consumed message: Hello Kafka
