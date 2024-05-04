# frozen_string_literal: true

module BugsBunny
  # Public: A class for managing RabbitMQ connections.
  class Connection
    require 'bunny'
    require 'singleton'

    include Singleton

    # Public: Obtains a singleton instance of Connection.
    #
    # host     - The RabbitMQ server address.
    # user     - The RabbitMQ user (optional, default: nil).
    # password - The RabbitMQ password (optional, default: nil).
    #
    # Examples
    #
    #   BugsBunny::Connection.instance("host", "user", "password")
    #   # => #<BugsBunny::Connection:0x00007fd40b9729b0>
    #
    # Returns the singleton instance of Connection.

    def self.instance(host, user = nil, password = nil)
      @instance ||= new(host, user, password)
    end

    def initialize(host, user = nil, password = nil)
      @host = host
      @user = user
      @password = password
      @connection = Bunny.new(
        host: host,
        user: user,
        password: password
      )
    end

    def start
      @connection.start
    end

    def close
      @connection.close
    end
  end
end
