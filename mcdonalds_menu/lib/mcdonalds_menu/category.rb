require 'pry'

class Category
  attr_accessor :name, :link
  
  @@all = []
  @@links = []

  def initialize(hash)
    hash.each {|k, v| self.send(("#{k}="), v)}  
    @link = link
    @name = name

    @@links << link
    @@all << self  
  end

  def self.all
    @@all
  end

  def self.links
  	@@links
  end

  def self.break_out_hashes(category_array)
    category_array.each do |hash|
    Category.new(hash)
  end
  end

end