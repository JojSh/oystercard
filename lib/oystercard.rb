require_relative 'station'
require_relative 'journey_log'

class Oystercard
  MAXIMUM_BALANCE = 90
  MAXIMUM_BALANCE_ERROR = "cannot exceed maximum amount £#{MAXIMUM_BALANCE}"
  MINIMUM_BALANCE = 1
  MINIMUM_BALANCE_ERROR = 'insufficient funds.'

  attr_reader :balance, :journeys

  def initialize(journey_log = Journey_log.new)
    @balance = 0
    @journey_log = journey_log
  end

  def top_up(amount)
    raise MAXIMUM_BALANCE_ERROR if @balance + amount > 90
    @balance += amount
  end

  def touch_in(station)
    raise MINIMUM_BALANCE_ERROR if @balance < MINIMUM_BALANCE
    deduct(@journey_log.current_journey.fare) if !@journey_log.current_journey.exit_station.nil?
    @journey_log.store_journeys if !@journey_log.current_journey.entry_station.nil?
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.current_journey.fare)
    @journey_log.store_journeys
  end

  def show_history
    @journey_log.journeys
  end


    private

    def deduct(amount)
      @balance -= amount
    end

end
