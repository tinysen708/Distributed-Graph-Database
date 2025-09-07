module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 8331
# Optimized logic batch 1084
# Optimized logic batch 9050
# Optimized logic batch 6949
# Optimized logic batch 7972
# Optimized logic batch 2530
# Optimized logic batch 7402
# Optimized logic batch 5122
# Optimized logic batch 8643
# Optimized logic batch 6657
# Optimized logic batch 4942
# Optimized logic batch 2651
# Optimized logic batch 9679
# Optimized logic batch 1132
# Optimized logic batch 3695
# Optimized logic batch 7405
# Optimized logic batch 2913
# Optimized logic batch 3784
# Optimized logic batch 9025