require 'journey_log'

describe Journey_log do

  subject(:journey_log) { described_class.new }

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }



  describe '#initialize' do

    it 'initializes with an empty journey history' do
      expect(journey_log.journeys).to be_empty
    end

  end


  describe '#journeys' do
    it 'records journeys' do
      journey_log.start(entry_station)
      journey_log.finish(exit_station)
      expect{ journey_log.store_journeys }.to change{ journey_log.journeys.length }.by(1)
    end
  end

  # it 'adds entries to journeys array when touching in twice' do
  #   allow(journey).to receive(:entry_station) { entry_station }
  #   expect{ card.touch_in(entry_station) }.to change{card.journeys.length}.by(1)
  # end




end
