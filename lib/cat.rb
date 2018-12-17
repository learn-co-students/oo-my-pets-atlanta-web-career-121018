class Cat
  attr_reader :name
  #putting name in reader means you can't change the name
  attr_accessor :mood

  def initialize(name, mood = "nervous")
    @name = name
    @mood = mood
  end
end
