# frozen_string_literal: true

RSpec.describe TrackDuration do
  subject(:track_duration) { described_class.new(param) }

  let(:param) { '3:45' }

  it 'has a version number' do
    expect(TrackDuration::VERSION).not_to be nil
  end

  describe 'seconds' do
    subject(:seconds) { track_duration.seconds }

    context 'when param is a string' do
      it { is_expected.to eq(225) }

      context 'when string has hours' do
        let(:param) { '15:03:45' }

        it { is_expected.to eq(54_225) }
      end

      context 'when string has more hours than one day' do
        let(:param) { '63:03:45' }

        it { is_expected.to eq(227_025) }
      end
    end

    context 'when param is the number of seconds' do
      let(:param) { 225 }

      it { is_expected.to eq(225) }
    end
  end

  describe 'to_s' do
    subject(:string) { track_duration.to_s }

    context 'when param is a string' do
      it { is_expected.to eq('03:45') }
    end

    context 'when param is the number of seconds' do
      let(:param) { 225 }

      it { is_expected.to eq('03:45') }

      context 'when number of seconds is greater than 1 hour' do
        let(:param) { 54_225 }

        it { is_expected.to eq('15:03:45') }
      end

      context 'when number of seconds is greater than 1 day' do
        let(:param) { 227_025 }

        it { is_expected.to eq('63:03:45') }
      end
    end
  end
end
