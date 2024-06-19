# frozen_string_literal: true

require './lib/2/2_1'

RSpec.describe '2_1, StateMachine:' do
  let(:t) { MyClass.new }

  it 'sets default state correctly' do
    expect(t.first?).to be true
    expect(t.state).to eq(:first)
  end

  describe 'modifies state to final state' do
    before do
      t.final!
    end

    it 'modifies state correctly' do
      expect(t.final?).to be true
      expect(t.state).to eq(:final)
    end

    it 'checks state correctly' do
      expect(t.first?).to be false
      expect(t.second?).to be false
      expect(t.final?).to be true
    end
  end
end
