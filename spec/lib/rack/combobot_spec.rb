require File.dirname(__FILE__) + '/../../spec_helper'

describe Rack::Combobot do
  include Rack::Test::Methods

  # the dummy app represents any other middleware in the rack stack
  let(:dummy_app_response) { [200, {"Content-Type" => "text/html"}, ["Dummy App"]] }
  let(:dummy_app) { Proc.new {|env| dummy_app_response } }

  before do
    @app = Rack::Combobot.new(dummy_app, :root => File.dirname(__FILE__) + '/../../public')
  end

  # request helpers
  let(:combobot_request)        { { 'PATH_INFO' => '/combobot' } }
  let(:combobot_js_request)     { combobot_request.merge({ "QUERY_STRING" => "js1.js&js2.js" })       }
  let(:combobot_css_request)    { combobot_request.merge({ "QUERY_STRING" => "css1.css&css2.css" })   }
  let(:combobot_404_request)    { combobot_request.merge({ "QUERY_STRING" => "js3.js&js4.js" })       }
  let(:combobot_hack_request)   { combobot_request.merge({ "QUERY_STRING" => "js3.js&../../js4.js" }) }

  # response helpers
  let(:combobot_js_response)    { [200, {"Content-Type" => "text/javascript"}, ["function lorem() { return \"a\"; }\nfunction ipsum() { return \"b\"; }\n"]] }
  let(:expires_js_response)     { [200, {"Content-Type" => "text/javascript", 'Expires' => 'Wed, 01 Jan 2020 00:00:00 GMT'}, ["function lorem() { return \"a\"; }\nfunction ipsum() { return \"b\"; }\n"]] }
  let(:combobot_css_response)   { [200, {"Content-Type" => "text/css"}, [".lorem { background: blue; }\n#lipsum { border: 1px solid red }\n"]] }
  let(:combobot_404_response)   { [404, {'Content-Type' => 'text/html'}, ['File not found']] }

  describe 'routing' do
    it 'should not respond to anything other than "/combobot"' do
      @app.call({}).must_equal(dummy_app_response)
    end
  end

  describe 'combination' do
    it "combines javascript" do
      @app.call(combobot_js_request).must_equal(combobot_js_response)
    end

    it "combines css" do
      @app.call(combobot_css_request).must_equal(combobot_css_response)
    end
  end

  describe 'error handling' do
    it "returns 404 when it can't find files" do
      @app.call(combobot_404_request).must_equal(combobot_404_response)
    end

    it 'returns 404 when trying to move up from the root dir' do
      @app.call(combobot_hack_request).must_equal(combobot_404_response)
    end
  end

  describe 'caching' do

    it 'adds expires headers' do
      @app.config.expires = Time.gm(2020)
      @app.call(combobot_js_request).must_equal(expires_js_response)
    end

    it 'allows for versioning' do
      @app.call(
        combobot_js_request.merge({ 'PATH_INFO' => '/combobot/CACHEBUSTINGSHA1'})
      ).must_equal(combobot_js_response)

      @app.call(
        combobot_js_request.merge({ 'PATH_INFO' => '/combobot/CACHEBUSTINGSHA2'})
      ).must_equal(combobot_js_response)
    end
  end

end
