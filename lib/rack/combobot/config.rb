module Rack
  class Combobot
    class Config
      attr_accessor :root, :expires

      def initialize(root, expires = nil)
        @root = root
        @expires = expires
      end

    end
  end
end

