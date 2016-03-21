require 'spec_helper'

class TestSort < RubySorts::SortBase
end

describe RubySorts::SortBase do
  let(:unsorted) { [4,2,3,1] }
  let(:sorted) { [1,2,3,4] }
  let(:sorter) { TestSort.new unsorted }

  describe '#new' do
    it 'makes a list from args' do
      expect(sorter.instance_variable_get :@unsorted).to include(1,2,3,4)
    end

    it 'makes a flat list from mixed args' do
      expect(TestSort.new([1,2], 3, [4,5]).instance_variable_get :@unsorted).to include(1,2,3,4,5)
    end
  end

  describe '#sort' do
    context 'when #sort is subclassed' do
      before do
        allow(sorter).to receive(:sort).and_return(sorted)
      end
      it 'sorts' do
        expect(sorter.sort).to eq sorted
      end
    end

    context 'when #sort is not subclassed' do
      it 'complains' do
        expect { sorter.sort }.to raise_error RuntimeError
      end
    end
  end
end