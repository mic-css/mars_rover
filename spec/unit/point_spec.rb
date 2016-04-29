require 'point'

describe Point do
  subject(:point) { described_class.new(3, 5) }

  let(:boundary_point) { described_class.new(5, 5) }

  describe '#initialize' do
    it 'initializes with an x-coordinate' do
      expect(point.x_coordinate).to eq(3)
    end

    it 'initializes with a y-coordinate' do
      expect(point.y_coordinate).to eq(5)
    end
  end

  describe '#increase_x' do
    it 'increases the x-coordinate by one' do
      point.increase_x(boundary_point)
      expect(point.x_coordinate).to eq(4)
    end
  end

  describe '#decrease_x' do
    it 'decreases the x-coordinate by one' do
      point.decrease_x(boundary_point)
      expect(point.x_coordinate).to eq(2)
    end
  end

  describe '#increase_y' do
    it 'increases the y-coordinate by one' do
      point.increase_y(boundary_point)
      expect(point.y_coordinate).to eq(6)
    end
  end

  describe '#decrease_y' do
    it 'decreases the y-coordinate by one' do
      point.decrease_y(boundary_point)
      expect(point.y_coordinate).to eq(4)
    end
  end
end
