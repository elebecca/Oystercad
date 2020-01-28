class Oystercard

    MINIMUM_BALANCE = 1
    MAXIMUM_BALANCE = 90

    attr_reader :balance
    attr_accessor :status
    
    def initialize
        @balance = 0
        @status = false
    end

    def top_up(amount)
        fail 'Maximum balance exceeded' if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end

    def in_journey?
        @status 
    end 
    def touch_in
        fail 'Low balance' if @balance < MINIMUM_BALANCE
        @status = true
    end
    def touch_out
        @status = false
        deduct(MINIMUM_BALANCE)
    end

    private

    def deduct(amount)
        @balance -= amount
    end
end