class Owner
  attr_accessor :cats, :dogs
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    self.save
  end

  def save
    @@all << self
  end
  
  def self.all
    @@all
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def buy_cat(name)
    Cat.new(name,self)
  end

  def feed_cats
    @cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    @dogs.each {|dog| dog.mood = "happy"}
  end

  def sell_pets
    # @cats.each do |cat|
    #   cat.mood = "nervous"
    #   cat.owner = nil
    # end
    # @dogs.each do |dog|
    #   dog.mood = "nervous"
    #   dog.owner = nil
    # end

    (@cats + @dogs).each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end

    @cats.clear
    @dogs.clear
  end

  def list_pets
    "I have #{@dogs.length} dog(s), and #{@cats.length} cat(s)."
  end

end