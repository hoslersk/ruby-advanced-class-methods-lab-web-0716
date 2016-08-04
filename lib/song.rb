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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    #binding.pry
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = Song.new#(name)
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    #binding.pry
    self.all.detect do |find|
      find.name == name
    end
    # new_song = Song.new (ex. from Intro to Modules Lab)
    # new_song.class
    #  => Song
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song = Song.new
    filename_name = filename.split(/\.|\s-\s/)
    #binding.pry
    song.name = filename_name[1]
    song.artist_name = filename_name[0]
    song.save
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
