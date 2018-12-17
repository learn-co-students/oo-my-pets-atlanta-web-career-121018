class Owner

  attr_accessor :pets, :name
  attr_reader :species

  @@pet_counter = 0
  @@all = []

  def initialize(species)
    @species = species
    @pets = { :fishes => [], :dogs => [], :cats => [] }
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.count
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    pets[:fishes] << fish
    @@pet_counter += 1
  end

  def buy_cat(name)
    cat = Cat.new(name)
    pets[:cats] << cat
    @@pet_counter += 1
  end

  def buy_dog(name)
    dog = Dog.new(name)
    pets[:dogs] << dog
    @@pet_counter += 1
  end

  def walk_dogs
    pets[:dogs].map {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].map {|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].map {|fish| fish.mood = "happy"}
  end

  def sell_pets
    pets[:dogs].map {|dog| dog.mood = "nervous"}
    pets[:cats].map {|cat| cat.mood = "nervous"}
    pets[:fishes].map {|fish| fish.mood = "nervous"}
    pets.clear
  end

  def list_pets
    "I have #{pets[:fishes].size} fish, #{pets[:dogs].size} dog(s), and #{pets[:cats].size} cat(s)."
  end

end
