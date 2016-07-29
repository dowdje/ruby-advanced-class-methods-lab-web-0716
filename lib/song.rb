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
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song.save
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    song.save
    song
  end

  def self.find_by_name(title)
    self.all.detect{|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
  
      if self.find_by_name(title)
        self.find_by_name(title)
      else
        create_by_name(title)
      end              
  end 

  def self.alphabetical
    self.all.sort_by(&:name)
  end

  def self.new_from_filename(artist_song)
    song_array = artist_song.split(" - ")
    song = self.new
    song.artist_name = song_array[0]
    song.name = song_array[1].split(".")[0]
    song
  end


  def self.create_from_filename(artist_song)
    song_array = artist_song.split(" - ")
    song = self.new
    song.artist_name = song_array[0]
    song.name = song_array[1].split(".")[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end






end
