require 'station.rb'
describe Station do
  let(:station) { Station.new('name', 5)}
 it "creates a new instance of station class" do
  expect(station).to eq station
 end

it "gives me the station name" do 
  expect(station.name).to eq "name"
end

it "gives me the station zone" do
  expect(station.zone).to eq 5
end

end