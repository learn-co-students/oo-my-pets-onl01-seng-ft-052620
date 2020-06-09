class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = Owner.new(owner).name
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end
end