# frozen_string_literal: true

require './lib/1/1_2'

RSpec.describe '1_2, Point:' do
  let(:point1) { Point.new(x: 12, y: 43, color: 'black') }
  let(:point2) { Point.new do |point|
    point.x = 12
    point.y = 43
    point.color = 'black'
  end }

  it 'creates the same point objects using block or hash given to initializer' do
    expect(point1).to eq(point2)
  end
end
