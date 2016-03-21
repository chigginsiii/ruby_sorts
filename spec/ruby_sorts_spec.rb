require 'spec_helper'

describe RubySorts do

  let(:sorted)   { (1..20).to_a }
  let(:unsorted) { sorted.shuffle }

  it 'has a version number' do
    expect(RubySorts::VERSION).not_to be nil
  end

  [:bubble, :selection, :insertion, :shell, :merge, :quick].each do |sort_type|
    describe "RubySorts##{sort_type}_sort" do
      it "#{sort_type} sorts" do
        expect(described_class.send("#{sort_type}_sort".to_sym, unsorted)).to eq sorted
      end
    end
  end
end
