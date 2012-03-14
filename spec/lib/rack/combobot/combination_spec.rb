require File.dirname(__FILE__) + '/../../../spec_helper'

describe Rack::Combobot::Combination do
  
  let(:combination) { Rack::Combobot::Combination.new(File.dirname(__FILE__) + '/../../../public', ['js1.js', 'js2.js']) }

  describe 'fetch' do

    it 'fetches files content' do
      contents = combination.fetch_file_contents(['js1.js', 'js2.js'])
      contents.must_equal(["function lorem() { return \"a\"; }\n", "function ipsum() { return \"b\"; }\n"])
    end

    describe 'error handling' do
      it 'raises PathError when files are not found' do
        proc { 
          combination.fetch_file_contents(['js3.js'])
        }.must_raise  Rack::Combobot::Combination::PathError
      end

      it 'raises PathError when trying to move outside the root' do
        proc { 
          combination.fetch_file_contents(['js1.js', '../../etc/hosts'])
        }.must_raise  Rack::Combobot::Combination::PathError
      end
    end
  end

  describe 'combination' do

    before do
      combination.fetch_file_contents(['js1.js', 'js2.js'])
    end

    it 'combines file content' do
      combination.combine.must_equal("function lorem() { return \"a\"; }\nfunction ipsum() { return \"b\"; }\n")
    end

  end

end
