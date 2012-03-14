# encoding: UTF-8

module Rack
  class Combobot
    class Combination
      def initialize(root, file_names)
        @root = root

        @file_contents = fetch_file_contents file_names if file_names
      end

      def fetch_file_contents(file_names = [])
        file_names.map do |file_name|

          raise PathError if file_name.include?('..') || file_name.include?("~")

          root_prefix = ::File.expand_path(".", @root) + "/"
          file_path   = ::File.expand_path(file_name, @root)

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
