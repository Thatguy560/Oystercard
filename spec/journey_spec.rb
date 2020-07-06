require 'journey'

describe Journey do 
  let(:station) { double :station }

  it "shows you before a journey is started the entry and exit station don't exist." do 
    expect(subject.entry_station).to eq nil 
    expect(subject.exit_station).to eq nil
  end

  it "shows you the entry station when a journey is started" do
    expect(subject.started_journey("Enfield Town")).to eq "Enfield Town"
  end

  it "shows you the exit station when a journey is finished" do
    expect(subject.finished_journey("Moorgate")).to eq "Moorgate"
  end

  it "checks that once in journey the entry station exists but the exit station doesn't exist yet" do
    subject.started_journey("Enfield Town")
    subject.in_journey?
    expect(subject.entry_station).to eq "Enfield Town"
    expect(subject.exit_station).to eq nil 
  end

  it "checks that if we forget to tap in at the station but we tap out we're charged the maximum fee" do
    subject.started_journey("Enfield Town")
    expect(subject.calculate_fare).to eq Journey::PENALTY_FARE
  end

  it "checks that if we don't tap out at the station we're charged the maximum fee" do
    subject.finished_journey("Old Street")
    expect(subject.calculate_fare).to eq Journey::PENALTY_FARE
  end

  it "will charge you the correct fee if you charge in and out correctly" do 
    subject.started_journey("Enfield Town")
    subject.finished_journey("Old Street")
    expect(subject.calculate_fare).to eq Journey::NORMAL_FARE
  end

end


