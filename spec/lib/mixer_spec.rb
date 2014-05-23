
require File.join(File.dirname(__FILE__),'../../lib/mixer.rb')
require "json"
describe "Mixer" do

    it "should traverse the data tree and contain the data in the result" do
        mix = MIX::Mixer.new(data)
        mix.mixItRuby(data)
        result =  mix.getResult
        puts result.inspect
        array_contains?(result,"Bond").should be_true

    end


    it "should preserver the sequence  of building blocks of the json in the result" do
        mix = MIX::Mixer.new(data)
        mix.mixItRuby(data)
        result =  mix.getResult
        result[0].should include("Bond")
    end


    def array_contains?(array, token)
        array.each do |element|
            if element =~ /#{token}/
                return true
            end
        end
         return false
    end

    def data
        dat={id: "adress.erb", name: "Bond", prename: "James", items: [{id: "item.erb", product: "car1", prize: "10"},{id: "item.erb" , product: "car2", prize: "11"}]}
        f=File.new("spec/testdata.json","w")
        f.write(dat.to_json)
        f.close
        dat
    end



end
