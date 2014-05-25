require 'stringio'
require 'spec_helper'
require File.join(File.dirname(__FILE__),'../../lib/mixer.rb')
require "json"
describe "Mixer" do

    it "should traverse the data tree and contain the data in the result" do
        mix = MIX::Mixer.new()
        mix.mixItRuby(data)
        result =  mix.getResult
        array_contains?(result,"Bond").should be_true
    end


    it "should preserver the sequence  of building blocks of the json in the result" do
        mix = MIX::Mixer.new()
        mix.mixItRuby(data)
        result =  mix.getResult
        result[0].should include("Bond")
    end



end


def data
    dat={id:  "adress.erb", name: "Bond", prename: "James", items: [{id: "item.erb", product: "car1", prize: "10"},{id: "item.erb" , product: "car2", prize: "11"}]}
end


def array_contains?(array, token)
    array.each do |element|
        if element =~ /#{token}/
            return true
        end
    end
    return false
end
