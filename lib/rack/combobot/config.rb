module Rack
  class Combobot
    class Config
      attr_accessor :root, :expires, :cache_control

      def initialize(options)
        @root           = options[:root]
        @expires        = options[:expires]
        @cache_control  = options[:cache_control]
      end

    end
  end
end

