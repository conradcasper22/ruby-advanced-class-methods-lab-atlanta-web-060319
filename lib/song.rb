class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    @song = Song.new
    @song.save
    @song
  end

  def self.new_by_name(name)
    @song = Song.new
    @song.name = name
    self.all << @song
    @song.save
    @song
  end

  def self.create_by_name(name)
    @song = Song.new
    @song.name = name
    self.all << @song
    @song.save
    @song
  end

  def self.find_by_name(name)
    @song = Song.all.find { |song| song.name === name }
  end

  def self.find_or_create_by_name(name)
    @song = Song.find_by_name(name)
    if @song
      @song
    else
      @song = Song.create_by_name(name)
      @song
    end
  end

  def self.alphabetical
    Song.all.sort { |a, b| a.name <=> b.name }.uniq
  end 

  def self.new_from_filename(filename)
    split_song = filename.split("-")
    artist_name = split_song[0].strip
    name = split_song[1].strip.delete_suffix!(".mp3")
    @song = Song.new
    @song.artist_name = artist_name
    @song.name = name
    @song
  end

  def self.create_from_filename(filename)
    @song = self.new_from_filename(filename)
    @song.save
    @song
  end

  
  def self.destroy_all
    @@all = []
  end


  def save
    self.class.all << self
  end

end
