module Rack
  class Combot
    class Config
      def initialize(root)
        @cache = []
        @root = root
      end

      def cache(*names)
        @cache.concat(names)
      end
      
      def root
        @root
      end
    end
  end
end

