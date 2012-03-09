require File.dirname(__FILE__) + '/spec_helper'

describe "combing assets from query string" do
  include Rack::Test::Methods

  before(:each) do
    @app = Rack::Combobot.configure(:root => File.dirname(__FILE__) + '/public')
  end

  it "combines javascript" do
    @app.call({
      "QUERY_STRING" => "js1.js&js2.js"
    }).must_equal([
      200,
      {"Content-Type" => "text/javascript"},
      ["function lorem() { return \"a\"; }\nfunction ipsum() { return \"b\"; }\n"]
    ])
  end

  it "combines css" do
    @app.call({
      "QUERY_STRING" => "css1.css&css2.css"
    }).must_equal([
      200,
      {"Content-Type" => "text/css"},
      [".lorem { background: blue; }\n#lipsum { border: 1px solid red }\n"]
    ])
  end

end
