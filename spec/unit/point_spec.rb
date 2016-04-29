require 'point'

describe Point do
  subject(:point) { described_class.new(1, 1) }

  let(:boundary_point) { described_class.new(2, 2) }

  describe '#initialize' do
    it 'initializes with an x-coordinate' do
      expect(point.x_coordinate).to eq(1)
    end

    it 'initializes with a y-coordinate' do
      expect(point.y_coordinate).to eq(1)
    end
  end

  describe '#increase_x' do
    it 'increases the x-coordinate by one' do
      point.increase_x(boundary_point)
      expect(point.x_coordinate).to eq(2)
    end

    context 'when the x-coordinate is at the terrain boundary' do
      it 'raises an error' do
        point.increase_x(boundary_point)
        expect { point.increase_x(boundary_point) }
          .to raise_error 'Out of bounds'
      end
    end
  end

  describe '#decrease_x' do
    it 'decreases the x-coordinate by one' do
      point.decrease_x(boundary_point)
      expect(point.x_coordinate).to eq(0)
    end

    context 'when the x-coordinate is at the terrain boundary' do
      it 'raises an error' do
        point.decrease_x(boundary_point)
        expect { point.decrease_x(boundary_point) }
          .to raise_error 'Out of bounds'
      end
    end
  end

  describe '#increase_y' do
    it 'increases the y-coordinate by one' do
      point.increase_y(boundary_point)
      expect(point.y_coordinate).to eq(2)
    end

    context 'when the y-coordinate is at the terrain boundary' do
      it 'raises an error' do
        point.increase_y(boundary_point)
        expect { point.increase_y(boundary_point) }
          .to raise_error 'Out of bounds'
      end
    end
  end

  describe '#decrease_y' do
    it 'decreases the y-coordinate by one' do
      point.decrease_y(boundary_point)
      expect(point.y_coordinate).to eq(0)
    end

    context 'when the y-coordinate is at the terrain boundary' do
      it 'raises an error' do
        point.decrease_y(boundary_point)
        expect { point.decrease_y(boundary_point) }
          .to raise_error 'Out of bounds'
      end
    end
  end
end
