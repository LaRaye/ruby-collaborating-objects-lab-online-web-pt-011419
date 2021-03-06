class Artist 
  @@all = []
  attr_accessor :name 
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    @songs << song
  end 
  
  def songs 
    @songs 
  end
  
  def self.all
    @@all 
  end 
  
  def save 
    @@all << self
  end 
  
  def self.find_or_create_by_name(name)
    if @@all.find {|artist| artist.name == name} != nil
      @@all.find {|artist| artist.name == name}  
    else
      artist = Artist.new(name)
      artist.save
      artist
    end  
  end 

  def print_songs
    @songs.each {|song| puts song.name}
  end 
  
end 