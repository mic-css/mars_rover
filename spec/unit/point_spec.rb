require 'point'

describe Point do
  subject(:point) { described_class.new(3, 5) }

  describe '#initialize' do
    it 'initializes with an x coordinate' do
      expect(point.x_coordinate).to eq(3)
    end

    it 'initializes with a y coordinate' do
      expect(point.y_coordinate).to eq(5)
    end
  end
end
