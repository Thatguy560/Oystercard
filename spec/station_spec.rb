require 'station'
describe Station do 

  let(:station) { described_class.new("Old Street", 1) }

  it "shows you the station name." do 
    expect(station.name).to eq("Old Street")
  end

  it "shows you the fare zone" do 
    expect(station.zone).to eq(1)
  end
end

