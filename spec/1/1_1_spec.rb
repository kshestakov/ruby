# frozen_string_literal: true

require './lib/1/1_1'

RSpec.describe '1_1, Array:' do
  let(:arr) { [1,2,3] }
  describe 'convert_all_to method' do
    it 'converts to correct types' do
      converted = arr.convert_all_to :string
      converted.each do |el|
        expect(el).to be_an_instance_of(String)
      end
    end

    it 'raises error while type is unknown' do
      expect { arr.convert_all_to(:bla) }.to raise_error(ArgumentError)
    end

    it 'returns new array' do
      converted = arr.convert_all_to :float
      expect(converted).not_to be(arr)
    end
  end

  describe 'convert_all_to! method' do
    it 'converts to correct types' do
      arr.convert_all_to! :string
      arr.each do |el|
        expect(el).to be_an_instance_of(String)
      end
    end

    it 'raises error while type is unknown' do
      expect { arr.convert_all_to! :bla }.to raise_error(ArgumentError)
    end
  end

  describe 'with_string_version_of_element method' do
    it 'converts element to strings' do
      arr.with_string_version_of_element do |el|
        expect(el).to be_an_instance_of(String)
      end
    end
  end
end
