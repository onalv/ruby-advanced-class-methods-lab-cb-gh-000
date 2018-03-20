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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song)
    new_song = self.create
    new_song.name = song
    new_song
  end

  def self.create_by_name(song)
    new_song = self.new_by_name(song)
    @@all << self
    new_song
  end

  def self.find_by_name(name_song)
    self.all.detect{|song| song.name == name_song}
  end

  def self.find_or_create_by_name(name_song)
    song = self.find_by_name(name_song)
    if !song
      self.create_by_name(name_song)
    else
      song
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
end
