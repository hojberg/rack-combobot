require 'rubygems'
require 'rack/test'
require 'minitest/spec'
require 'minitest/autorun'
require File.expand_path(File.dirname(__FILE__) + '/../rack_combot')

describe "something" do
  include Rack::Test::Methods

  before do
    @app = RackCombo.new
  end

  it "combines files" do

    3.must_equal(4)
  end

  after(:each) do
  end
end
