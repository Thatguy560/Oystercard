require 'Oystercard.rb'

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  it 'Oystercard has default balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'top_up method which adds money to my Oysercard balance' do
    expect(subject.top_up(5)).to eq(5)
  end

  context 'when balance is above £90' do 
    it 'top_up method rasies error' do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      expect { subject.top_up(1) }.to raise_error "Balance cannot exceed #{Oystercard::MAXIMUM_BALANCE}"
    end
  end

  it 'initially not in journey' do
    expect(subject).not_to be_in_journey
  end

  it 'can touch in' do
    subject.top_up(Oystercard::MINIMUM_BALANCE)
    subject.touch_in(entry_station)
    expect(subject).to be_in_journey
  end

  context 'when below minimum balance of £1' do
    it 'touch in method raises error' do
      expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient balance to touch in" 
    end
  end

  it 'expects to make a charge when you touch out' do
    expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)
  end

  # #In order to pay for my journey As a customer I need to know where
  #  I've travelled from
  it "expects to know where I've travelled from" do
    subject.top_up(Oystercard::MAXIMUM_BALANCE)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq(entry_station)
  end

  it "can check my default journey history that should be empty" do  
    expect(subject.journey_history).to eq []
  end 

  context "Testing a complete journey" do
    #creating a context block so the before block (that is right below this message) doesnt get applied to
    #the above tests. 
    before do
      # the before block will run this code before each and every one of the following test, that
      # are in this block (testing a complete journey)
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
    end
    it 'will return a hash of one journey' do
      # we want the journey history (that can be accessed as its an attribute reader) to return the journey that
      # we just did. This means we need to push the entry station, and exit station, into a hash that is pushed
      # into an array that is @journey_history (see the def initialize in the oyster.rb)
      expect(subject.journey_history).to eq [{entry_station => exit_station}]
    end

    it 'will return check that the journey array has one journey in it' do
      expect(subject.journey_history.length).to eq 1
    end

    it 'can touch out' do
      expect(subject).not_to be_in_journey
    end

    it "expects to forget entry station when tapping out" do 
      # we dont want to keep the entry station when tapping out, so in the method touch out, we should
      # set the entry station to nil, like it started with
      expect(subject.entry_station).to eq nil 
    end
  end
end





 # it 'deducts money from balance' do
  #   subject.top_up(10)
  #   expect(subject.deduct(5)).to eq(5)
  # end
