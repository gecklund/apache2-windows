$:.push File.expand_path(File.join("..", "..", "..", "..", "libraries"), __FILE__)

require "spec_helper"
require "helper"

describe ApacheWindows::Helper do
  describe '.uniquely_add_array' do
    context 'when adding an array to another' do
      describe 'with no conflicts' do
        it 'returns an array' do
          s = ['foo', 'bar']
          t = ['baz']
          described_class.uniquely_add_array(s, t).should == ['foo', 'bar', 'baz']
        end
      end
      describe 'with conflicts' do
        it 'returns an array with duplicates removed' do
          s = ['foo', 'bar']
          t = ['bar', 'baz']
          described_class.uniquely_add_array(s, t).should == ['foo', 'bar', 'baz']
        end
      end
    end
    
    context 'when adding a string to an array' do
      describe 'with no conflicts' do
        it 'returns an array' do
          s = ['foo', 'bar']
          t= 'baz'
          described_class.uniquely_add_array(s, t).should == ['foo', 'bar', 'baz']
        end
      end
      describe 'with conflicts' do
        it 'returns an array with duplicates removed' do
          s = ['foo', 'bar']
          t = 'bar'
          described_class.uniquely_add_array(s, t).should == ['foo', 'bar']
        end
      end
    end
  end
end
