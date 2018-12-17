class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(species)
    @@all << self
    #puts all new instances of Owner into @@all
    @species = species
    #can't change species -- use attr_reader
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{self.species}."
    #self.species is possible bc Owner is initialized w species ?
  end

  def buy_fish(fish_name)
    pets[:fishes] << Fish.new(fish_name)
    #can use << because it is an array
  end

  def buy_cat(cat_name)
    pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
    pets[:dogs] << Dog.new(dog_name)
  end

  def walk_dogs
    pets[:dogs].each do |dog|
      dog.mood = "happy"
      #in pets hash, find :dogs and change each dog's mood to happy
    end
  end

  def play_with_cats
    pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    pets.each do |species, pet_names| #fishes => [names]
      pet_names.each do |pet| #[names] => name, name, name
        pet.mood = "nervous"
      end
    end
    pets.clear
  end

  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end

end
