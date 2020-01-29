class Oystercard

    MINIMUM_BALANCE = 1
    MAXIMUM_BALANCE = 90

    attr_reader :balance, :entry_station, :exit_station, :list_stations
    attr_accessor :status
    
    def initialize
        @balance = 0
        @status = false
        @entry_station = nil
        @exit_station = nil
        @list_stations = {}
    end

    def top_up(amount)
        fail 'Maximum balance exceeded' if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end

    def in_journey?
        @status 
    end 
    def touch_in(station)
        fail 'Low balance' if @balance < MINIMUM_BALANCE
        @status = true
        @list_stations.store(:entry_station, station)
        @entry_station = station
    end
    def touch_out(station)
        @status = false
        deduct(MINIMUM_BALANCE)
        @entry_station = nil
        @list_stations.store(:exit_station, station)
        @exit_station = station
    end
    

    private

    def deduct(amount)
        @balance -= amount
    end
test = Oystercard.new
test.top_up(20)
test.touch_in("Stratford")
test.touch_out("Bank")
p @list_stations

end