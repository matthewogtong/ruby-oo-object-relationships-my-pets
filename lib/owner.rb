class Owner
  # code goes here
  # attr_accessor 
  attr_reader :name, :species
  @@all = []

  def initialize(name) 
    @name = name
    @species = "human"
    @@all << self
  end 

  def say_species 
    "I am a #{self.species}."
  end 

  def self.all
    @@all
  end

  def self.count 
    self.all.count
  end 
    
  def self.reset_all
    @@all = []
  end

  def cats 
    Cat.all.select {|cats| cats.owner == self}
  end 

  def dogs
    Dog.all.select {|dogs| dogs.owner == self}
  end 

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each{ |dog| dog.mood = 'happy'}
  end 

  def feed_cats
    self.cats.each{ |cat| cat.mood = 'happy'}
  end 

  def sell_pets
    self.cats.each{ |cat| cat.mood = 'nervous'}
    self.dogs.each{ |dog| dog.mood = 'nervous'}
    self.cats.each{ |cat| cat.owner = nil}
    self.dogs.each{ |dog| dog.owner = nil}
  end 

  def list_pets
     "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  # "I have #{@owner.dogs.count} dog(s), and #{@owner.cats.count} cat(s)." <<<
end
