class Oystercard

    MINIMUM_BALANCE = 1
    MAXIMUM_BALANCE = 90

    attr_reader :balance, :entry_station
    attr_accessor :status
    
    def initialize
        @balance = 0
        @status = false
        @entry_station = nil
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
        @entry_station = station
        
    end
    def touch_out
        @status = false
        deduct(MINIMUM_BALANCE)
        @entry_station = nil
    end
    

    private

    def deduct(amount)
        @balance -= amount
    end
end