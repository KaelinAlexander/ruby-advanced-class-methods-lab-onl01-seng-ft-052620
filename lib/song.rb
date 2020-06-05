require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end
  
  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end 
  
  def self.find_by_name(title)
    self.all.find{|song| song.name == title}
  end
  
  def self.find_or_create_by_name(title)
      if self.find_by_name(title) == NIL
        self.create_by_name(title)
      else
        self.find_by_name(title)
      end
  end
  
  def self.new_from_filename(mp3)
    file = mp3.delete_suffix(".mp3")
    file_array = file.split(" - ")
    artist_name = file_array[0]
    name = file_array[1]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(mp3)
    file = mp3.delete_suffix(".mp3")
    file_array = file.split(" - ")
    artist_name = file_array[0]
    name = file_array[1]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    self.all << song
    @artist = song.artist_name
  end
  
  def self.alphabetical
    alphabetized = self.all.sort_by {|song| song.name}
    alphabetized
  end

  def self.destroy_all
    self.all.clear
  end


end
