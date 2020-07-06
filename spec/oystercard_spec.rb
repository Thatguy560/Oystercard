require 'oystercard'
require 'journey'
require 'station'

describe Oystercard do 
  let(:oystercard) { Oystercard.new }
  let(:entry_station){ double :entry_station}
  let(:exit_station){ double :exit_station}
  
  it "will let you top up your Oystercard" do 
    subject.top_up(5)
    expect(subject.balance).to eq(5)
  end

  it "wont let you travel unless you have the minimum balance of £1" do
    expect{ subject.touch_in(entry_station) }.to raise_error "Minimum balance of £#{Oystercard::MINIMUM_BALANCE} needed."
  end

  context "for making journeys with your Oystercard" do # #creating a context block so the before block (that is right below this message) doesnt get applied to
    #the above tests. 
    before do
      subject.top_up(Oystercard::MAXIMUM_BALANCE)
    end 

    it "has a maximum balance of £90." do 
      expect{subject.top_up(1)}.to raise_error "Maximum balance of £#{Oystercard::MAXIMUM_BALANCE} reached"
    end

    it "will allow you to check the Oystercard balance at any time." do 
      expect {subject.check_balance}.to output("Your current Oystercard balance is £#{subject.balance}.00\n").to_stdout
    end
    
    it "expects to know where I've travelled from" do 
      subject.touch_in("Enfield Town")
      expect(subject.current_trip.entry_station).to eq("Enfield Town")
    end
    
    it "will save a journey if you touch in and out at the station" do 
      subject.touch_in("Enfield Town")
      subject.touch_out("London Liverpool Street")
      expect(subject.journey_history.length).to eq 1
    end 
    
    it "will also save a journey if you forget to touch in" do 
      subject.touch_out("London Liverpool Street")
      expect(subject.journey_history.length).to eq 1
    end 

    it "if no journeys have been made yet it will tell you" do 
      expect(subject.journey_history).to eq "No Journeys have been made yet on this Oystercard"
    end

  end
end