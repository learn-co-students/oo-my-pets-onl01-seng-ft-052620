class Dog
attr_accessor :owner
attr_reader :name
attr_writer :mood

@@all = []

def initialize(name, owner)
  @name = name
  @owner = owner
  @@all << self
end

def mood
  @mood ? @mood : "nervous"
end

def self.all
  @@all
end

end