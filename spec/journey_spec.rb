require 'journey'

describe Journey do
    it 'checks that a journey has been instantiated' do
        expect(subject).to eq subject
    end

    it 'initially not in journey' do
        expect(subject).not_to be_in_journey
    end

    it "can check my default journey history that should be empty" do  
        expect(subject.journey_history).to eq []
      end 
end