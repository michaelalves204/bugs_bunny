# frozen_string_literal: true

require_relative 'bugs_bunny/version'
require_relative 'bugs_bunny/connection'

module BugsBunny
  class Error < StandardError; end

  # Public: A class for monitoring RabbitMQ queues.
  class Monitoring
    include Singleton

    # Public: Obtains a singleton instance of Monitoring.
    #
    # host     - The RabbitMQ server address.
    # user     - The RabbitMQ user (optional, default: nil).
    # password - The RabbitMQ password (optional, default: nil).
    #
    # Examples
    #
    #   BugsBunny::Monitoring.instance("host", "user", "password")
    #   # => #<BugsBunny::Monitoring:0x00007fd40b9729b0>
    #
    # Returns the singleton instance of Monitoring.

    def self.instance(host, user = nil, password = nil)
      @instance ||= new(host, user, password)
    end

    def initialize(host, user = nil, password = nil)
      @host = host
      @user = user
      @password = password
      @connection = BugsBunny::Connection.instance(@host, @user, @password).start
    end

    def queue(name:, durable:, auto_delete:)
      @queue ||=
        channel.queue(
          name,
          durable: durable,
          auto_delete: auto_delete
        )
    end

    def options(queue)
      queue.options
    end

    def status(queue)
      queue.status
    end

    def info(queue)
      queue.inspect
    end

    def messages(queue)
      queue.pop
    end

    private

    def channel
      @channel ||= @connection.create_channel
    end
  end
end
