require'pry'


class Owner

    attr_accessor :pets
    attr_reader :name, :species
    @@all = []
    @@count = 0

    def initialize (species="human", name)
        @species = species
        @name = name
        @pets = {fishes: [], cats: [], dogs: []}
        @@all << self
        @@count += 1
    end

    def self.all
        @@all
    end

    def self.count
        @@count
    end

    def self.reset_all
        @@all = []
        @@count = 0
    end

    def say_species
        "I am a #{@species}."
    end

    def name=(name)
        @name = name
    end

    def buy_fish(name)
        new_fish = Fish.new(name)
        @pets[:fishes] << new_fish
    end

    def buy_cat(name)
        new_cat = Cat.new(name)
        @pets[:cats] << new_cat
    end

    def buy_dog(name)
        new_dog = Dog.new(name)
        @pets[:dogs] << new_dog
    end

    def walk_dogs
        @pets[:dogs].each do |attributes|
            attributes.mood = "happy"
        end
    end

    def play_with_cats
        @pets[:cats].each do |attributes|
            attributes.mood = "happy"
        end
    end

    def feed_fish
        @pets[:fishes].each do |attributes|
            attributes.mood = "happy"
        end
    end

    def sell_pets
        @pets.each {|pets, attributes| attributes.each {|data| data.mood = "nervous"}}
        @pets = {fishes: [], cats: [], dogs: []}
    end

    def list_pets
        "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
    end
end
