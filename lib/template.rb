
#This file is for future use to extract the variables from a erb template


class Template
  attr_accessor :file_path,:contents

  def self.all
    Dir.glob("lib/templates/*").collect{|t| Template.new(t)}
  end 
 
  def initialize(file_path)
    @file_path = file_path
    @contents = File.open(@file_path, "rb").read
  end 
 
  def variables
    self.contents.scan(/(\@[a-z]+[0-9a-z_]*)/i).uniq
  end 
end
