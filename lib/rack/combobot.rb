# encoding: UTF-8

require "rack/combobot/config"
require "rack/combobot/combination"
require "pathname"
require "uri"

module Rack
  class Combobot

    MIME_TYPES = {
      "js"  => "text/javascript",
      "css" => "text/css"
    }

    def initialize(app, options = {})
      @app = app

      root = Pathname.new(options[:root] || Dir.pwd)
      @config = Rack::Combobot::Config.new(root)
    end

    # rack request handler
    def call(env)
      if Rack::Request.new(env).path == '/combobot'
        combine(env)
      else
        @app.call(env)
      end
    end

    def combine(env)
      params      = env["QUERY_STRING"]
      file_names  = params.split("&")

      return not_found if file_names.empty?

      extension   = file_names[0].split(".").last

      begin
        combo = Combination.new(@config.root, file_names).combine
        [200, {"Content-Type" => MIME_TYPES[extension]}, [combo]]
      rescue Combination::PathError
        not_found
      end
    end

    def not_found
      [404, {'Content-Type' => 'text/html'}, ['File not found']]
    end

  end
end
