require 'stations'

describe Station do

  subject {described_class.new(name:"happyland", zone: 10)}

  it "knows the zone" do
    expect(subject.zone).to eq(10)
  end
  it "knows the name" do
    expect(subject.name).to eq "happyland"
  end
end
describe Station do

  subject {described_class.new(name:"Makers", zone: 2)}

  it "knows the zone" do
    expect(subject.zone).to eq(2)
  end
  it "knows the name" do
    expect(subject.name).to eq "Makers"
  end
end
