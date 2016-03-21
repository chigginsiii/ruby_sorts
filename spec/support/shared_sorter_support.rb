RSpec.shared_examples "a sorter" do
  let(:unsorted) { sorted.shuffle }
  let(:sorted) { (0..20).to_a }
  let(:sorter) { described_class.new unsorted }

  describe '#sort' do
    it 'orders an unordered list' do
      expect(described_class.new(unsorted).sort).to eq sorted
    end
  end
end