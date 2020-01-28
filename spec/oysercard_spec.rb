require 'oystercard'

describe Oystercard do
    it "has a balance of 0 by default" do
        expect(subject.balance).to eq 0
    end

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts an amount from the balance' do
        subject.top_up(20)
        expect{ subject.deduct 3}.to change{ subject.balance }.by -3
    end

    describe '#in_journey?' do
        it "check if the custumer is in the journey" do
            subject.touch_in
            expect(subject.in_journey?).to eq true
        end
    end
    
    describe '#touch_in' do
        it 'check if the card touched in' do
            expect{ subject.touch_in}.to change{subject.status}.from(false).to(true)
        end
    end

    describe '#touch_out' do
        it "check if the card touch out" do
            subject.touch_in 
            expect{ subject.touch_out}.to change{subject.status}.from(true).to(false)
        end
    end


    describe '#top_up' do
    
        it { is_expected.to respond_to(:top_up).with(1).argument }

        it 'can top up the balance' do
            expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
        end

        it 'raises an error if the maximum balance is exceeded' do
            maximum_balance = Oystercard::MAXIMUM_BALANCE
            subject.top_up(maximum_balance)
            expect{ subject.top_up 1 }.to raise_error 'Maximum balance exceeded'
          end
    end
end