class Oystercard

    MINIMUM_BALANCE = 1
    MAXIMUM_BALANCE = 90

    attr_reader :balance, :list_stations
    attr_accessor :status
    
    def initialize
        @balance = 0
        @status = false
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
    end

    def touch_out(station)
        @status = false
        deduct(MINIMUM_BALANCE)
        @list_stations.store(:exit_station, station)
    end
    

    private

    def deduct(amount)
        @balance -= amount
    end

end