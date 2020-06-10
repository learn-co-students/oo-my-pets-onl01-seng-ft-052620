class Owner
  @@all = []
  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.count
    all.count
  end

  def self.reset_all
    @@all.clear
  end

  def species
    "human"
  end

  def say_species
    "I am a human."
  end

  def cats
    Cat.all.select{|c| c.owner == self}
  end

  def dogs
    Dog.all.select{|d| d.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|d| d.mood = "happy"}
  end

  def feed_cats
    cats.each {|c| c.mood = "happy"}
  end

  def sell_pets
    cats.concat(dogs).each do |d|
      d.mood = "nervous"
      d.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end