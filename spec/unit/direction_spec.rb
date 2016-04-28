require 'direction'

describe Direction do
  subject(:direction) { described_class.new }

  describe '#initialize' do
    it 'initializes with a Northernly direction by default' do
      expect(direction.current).to eq(:N)
    end
  end
end
