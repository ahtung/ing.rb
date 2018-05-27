require "active_support/all"

module IngRb
  # Shared
  module Shared
    extend ActiveSupport::Concern

    module ClassMethods
      def implements(*calls)
        calls.each do |call|
          case call
          when :get
            implements_get
          when :list
            implements_list
          when :delete
            implements_delete
          else
            puts "ERROR for: #{call}"
          end
        end
      end

      private

      def implements_delete
        define_singleton_method(:delete) do |*args|
          id = args.pop
          full_uri = [url(*args), id].join("/")
          response = Client.send_method(:delete, full_uri)
          []
        end
      end

      def implements_get
        define_singleton_method(:find) do |*args|
          id = args.pop
          full_uri = [url(*args), id].join("/")
          response = Client.send_method(:get, full_uri)
          new(response[0].values.first)
        end
      end

      def implements_list
        define_singleton_method(:all) do |*args|
          Enumerator.new do |yielder|
            older_url = counted_url(args)
            loop do
              results = Client.raw_send_method(:get, older_url)
              json = JSON.parse(results.body)
              json["Response"].map { |item| yielder << new(item.values.first) }
              raise StopIteration if json["Pagination"].nil? || json["Pagination"]["older_url"].nil?
              older_url = json["Pagination"]["older_url"]
            end
          end.lazy
        end
      end

      def counted_url(args)
        page_size = IngRb.configuration.page_size
        arged_url = Addressable::Template.new("#{url(*args)}{?query*}")
        params = page_size == 10 ? {} : { count: page_size }
        arged_url.expand(query: params).to_s
      end
    end
  end
end
