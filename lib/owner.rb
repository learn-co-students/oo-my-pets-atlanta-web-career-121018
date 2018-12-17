require 'pry'
require_relative "./cat.rb"
require_relative "./dog.rb"
require_relative "./fish.rb"

class Owner
  attr_reader :species
  attr_accessor :name, :pets
  @@all = []

def initialize(name)
  @name = name
  @species = "human"
  @pets = {fishes: [], cats: [], dogs: []}
  self.class.all << self
end

def self.all
  @@all
end

def self.count
  all.size
end

def self.reset_all
  all.clear
end

def say_species
  "I am a #{self.species}."
end

def buy_cat(name)
  self.pets[:cats] << Cat.new(name)
end

def buy_dog(name)
  self.pets[:dogs] << Dog.new(name)
end

def buy_fish(name)
  self.pets[:fishes] << Fish.new(name)
end

def play_with_cats
  self.pets[:cats].each do |cat|
    cat.mood = "happy"
  end
end

def walk_dogs
  self.pets[:dogs].each do |dog|
    dog.mood = "happy"
  end
end

def feed_fish
  self.pets[:fishes].each do |fish|
    fish.mood = "happy"
  end
end

def sell_pets
  self.pets.each do |type, pets|
    pets.each do |pet|
      pet.mood = "nervous"
    end

    pets.clear
  end
end

def list_pets
  count_pets
  "I have #{@fishes_count} fish, #{@dogs_count} dog(s), and #{@cats_count} cat(s)."
end

private

def count_pets
  self.pets.each do |type, pets|
    self.instance_variable_set("@#{type}_count", pets.size)
  end
end

end
