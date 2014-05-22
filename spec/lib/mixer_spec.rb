
require File.join(File.dirname(__FILE__),'../../lib/mixer.rb')

describe "Mixer" do

it "should traverse the data tree" do
    mix = MIX::Mixer.new(data)
    mix.mixItBaby(data)
    puts "------------------------------------------_"
    result =  mix.getResult
    puts result
    result.should include("Bond")
    puts "..........................................."
    
end

def data
  {id: "adress.erb", name: "Bond", prename: "James", items: [{id: "item.erb", product: "car1", prize: "10"},{id: "item.erb" , product: "car2", prize: "11"}]}
end



end
