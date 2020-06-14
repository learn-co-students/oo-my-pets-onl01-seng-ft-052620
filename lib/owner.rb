class Owner

  attr_reader :name, :species

  @@owner = []

  def initialize(name)
    @name = name
    @@owner << self
    @species = "human"
  end

  def say_species
    @self = "I am a human."
  end

  def self.all
    @@owner
  end

  def self.count
    @@owner.size
  end

  def self.reset_all
    @@owner.clear
  end

  def cats 
    owned_cat = Cat.all.select {|cat| cat.owner == self}
    owned_cat
  end

  def dogs
    owned_dog = Dog.all.select {|dog| dog.owner == self}
    owned_dog
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    Cat.all.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end
    Dog.all.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
  end

  def list_pets

    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end
  
end
