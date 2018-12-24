


class Cat

    attr_accessor :mood
    attr_reader :name
    @@all = []

    def initialize (name)
        @name = name
        @mood = "nervous"
        @@all << self
    end

end
