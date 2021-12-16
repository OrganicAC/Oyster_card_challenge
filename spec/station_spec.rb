require 'station'

describe Station do
  subject {described_class.new("Euston", 2)}
  it 'Returns station name' do
    expect(subject.name).to eq "Euston" 
  end 
  it 'Returns station zone' do
    expect(subject.zone).to eq 2
  end
end 

