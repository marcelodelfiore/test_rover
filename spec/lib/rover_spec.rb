require 'spec_helper'
require 'rover'

describe Rover do
  context 'Object initialization' do
    context 'Default params' do
      subject(:rover1) { described_class.new }

      let(:dir) { 'N' }
      let(:x0) { 0 }
      let(:y0) { 0 }
      let(:plateau_dim) { [5,5] }

      it 'default' do
        expect(rover1.direction).to eq(dir)
        expect(rover1.x_pos).to eq(x0)
        expect(rover1.y_pos).to eq(y0)
      end
    end

    context 'some params' do
      subject(:rover1) { described_class.new(direction: dir, x_pos: x0, y_pos: y0, plateau_dim: plateau_dim) }

      let(:dir) { 'N' }
      let(:x0) { 0 }
      let(:y0) { 0 }
      let(:plateau_dim) { [5,5] }

      it 'Some params' do
        expect(rover1.direction).to eq(dir)
        expect(rover1.x_pos).to eq(x0)
        expect(rover1.y_pos).to eq(y0)
      end
    end
  end
end
