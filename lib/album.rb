class Album
  attr_accessor :name
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new({ :name => self.name, :id => self.id })
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name)
    self.name = name
    @@albums[self.id] = Album.new({ :name => self.name, :id => self.id })
  end

  def delete
    @@albums.delete(self.id)
  end

  def songs
    Song.find_by_album(self.id)
  end
end
