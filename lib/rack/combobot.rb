require "rack/combobot/config"
require "pathname"
require "uri"

module Rack
  class Combobot
    def self.configure(*args)
      new(*args)
    end

    MIME_TYPES = {
      "js"  => "text/javascript",
      "css" => "text/css"
    }

    def initialize(options = {})
      root = Pathname.new(options[:root] || Dir.pwd)
      @config = Rack::Combobot::Config.new(root)
    end

    # rack request handler
    def call(env)
      params      = env["QUERY_STRING"]
      file_names  = params.split("&")
      extention   = file_names[0].split(".").last

      begin
        combo = Combination.new(@config.root, file_names).combine
        [200, {"Content-Type" => MIME_TYPES[extention]}, [combo]]
      rescue Combination::PathError
        not_found
      end
    end

    def not_found
      [404, {'Content-Type' => 'text/html'}, ['File not found']]
    end

    class Combination
      def initialize(root, file_names)
        @file_contents = combine_files(root, file_names)
      end

      def combine_files(root, file_names = [])
        file_names.map do |file_name|

          raise PathError if file_name.include?('..') || file_name.include?("~")

          root_prefix = ::File.expand_path(".", root) + "/"
          file_path   = ::File.expand_path(file_name, root)

          raise PathError unless file_path.start_with?(root_prefix) && ::File.exist?(file_path)

          file_content = ::File.open(file_path, 'r') { |f| f.read }
        end
      end

      def combine
        @combo ||= @file_contents.join
      end

      class PathError < ArgumentError; end
    end
  end
end
