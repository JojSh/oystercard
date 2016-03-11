require_relative 'journey'

class Journey_log

  attr_reader :journeys

  def initialize(journey_class = Journey)
    @journeys = []
    @journey_class = journey_class
  end

  def start(station)
    current_journey
    @this_journey.enters(station)
  end

  def finish(station)
    current_journey
    @this_journey.exits(station)
  end

  def store_journeys
    @journeys << @this_journey
    @journey_class = nil
  end


  def current_journey
      @this_journey ||= @journey_class.new
  end

  def journeys
    @journeys
  end


end
