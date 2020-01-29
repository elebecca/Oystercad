require 'oystercard'

describe Oystercard do
    
    it "has a balance of 0 by default" do
        expect(subject.balance).to eq 0
    end

    describe '#in_journey?' do
        it "check if the custumer is in the journey" do
            subject.top_up(2)
            subject.touch_in("station")
            expect(subject.in_journey?).to eq true
        end
    end
    
    describe '#touch_in' do
        it 'check if the card touched in' do
            subject.top_up(2)
            expect{ subject.touch_in("station") }.to change{subject.status}.from(false).to(true)
        end

        it 'raise and error if you reach the minimum balance' do

            expect{ subject.touch_in("station") }.to raise_error('Low balance')
        end
    end

    describe '#touch_out' do
        it "check if the card touch out" do
            subject.top_up(2)
            subject.touch_in("station")
            expect{ subject.touch_out }.to change{subject.status}.from(true).to(false)
        end

        it "charge for the jorney" do
            subject.top_up(2)
            subject.touch_in("station")
            expect{ subject.touch_out }.to change{subject.balance}.by(-1)
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
    
    #it "should remeber the entry station" do
    #    station1 = double('station')
    #    allow(station1).to receive(:name) { 'Stratford' }
    #    subject.top_up(2)
    #    subject.touch_in(station.name)
    #    expect(subject.entry_station).to eq ('Stratford')
    #end

    let(:station){ double :station }
    it "store station in entry station" do
        station = double('station')
        subject.top_up(2)
        test = subject.touch_in(station)
        expect(test).to eq station
    end
end
