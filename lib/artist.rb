
class Artist

  def initialize(attributes)
    @name=attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def ==(artist_to_compare)
    if artist_to_compare != nil
      self.name() == artist_to_compare.name()
    else
      false
    end
  end

  def self.all()
    returned_artists= DB.exec("SELECT * FROM artists;")
    artists = []
    returned_artists.each() do |artist|
      name = artist.fetch("name")
      id = artist.fetch("id").to_i
      artists.push(Artist.new({:name => name, :id => id}))
    end
    artists

  end

  def self.clear()
    DB.exec("DELETE FROM artists *;")
  end

  def self.find()
    artist = DB.exec("SELECT * FROM artists WHERE id = #{id};").first
    if album
      name = artist.fetch("name")
      id = artist.fetch("id").to_i
      Artist.new({:name => name, :id => id})
    else
      nil
    end
  end

  def save()
    result = DB.exec("INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def delete()
    DB.exec("DELETE FROM artists WHERE id = #{@id}")
    DB.exec("DELETE FROM albums WHERE id = #{@id};")
    DB.exec("DELETE FROM songs WHERE album_id = #{@id};")
  end
end


