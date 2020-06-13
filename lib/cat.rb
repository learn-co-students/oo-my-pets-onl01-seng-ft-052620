class Cat

  attr_accessor :owner, :mood
  attr_reader :name

  @@cats = []

  def initialize(name, owner)
      @name = name
      @@cats << self
      @owner = owner 
      @mood = "nervous"    
  end
  
  def self.all
    @@cats
  end
  # code goes here
end