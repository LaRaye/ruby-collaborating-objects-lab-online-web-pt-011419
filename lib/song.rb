require 'pry'
class Song 
  attr_accessor :name, :artist 
  
  def initialize(name)
    @name = name
  end
  
  def self.artist(artist_name)
    Artist.find_or_create_by_name(artist_name)
  end 
  
  def self.new_by_filename(filename)
    filename_parsed = filename.split(" - ")
    filename_parsed[-1] = filename_parsed[-1].split(".")[0]
    song = self.new(filename_parsed[1])
    song.artist = Song.artist(filename_parsed[0])
    song.artist.add_song(song)
    song
  end 
end 