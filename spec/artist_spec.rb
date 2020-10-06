require 'spec_helper'

describe '#Artist' do
  
  describe('.all') do
    it("returns an empty array when there are no artists") do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an artist") do
      artist = Artist.new({:name => "Outkast", :id => nil})
      artist.save()
      expect(Artist.all).to(eq([artist ]))
    end
  end

  describe('.clear') do
    it("clears all artists") do
      artist = Artist.new({:name => "Outkast", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Blue October", :id => nil})
      artist2.save()
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same artist if it has the same attributes as another artist") do
      artist = Artist.new({:name => "Blue October", :id => nil})
      artist2 = Artist.new({:name => "Blue October", :id => nil})
      expect(artist).to(eq(artist2))
    end
  end

  describe('.find') do
    it("finds an artist by id") do
      artist = Artist.new({:name => "Outkast", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Blue October", :id => nil})
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('.find') do
    it("returns nil if user searches for an artist id that doesn't exist") do
    artist = Artist.new({:name => "Outkast", :id => nil})
    artist.save()
    artist.delete()
    expect(Artist.find(artist.id)).to(eq(nil))
    end
  end

  describe('#update') do
    it("updates an artist by id") do
      artist = Artist.new({:name => "Outkast", :id => nil})
      artist.save()
      artist.update(:name => "Big Boi")
      expect(artist.name).to(eq("Big Boi"))
    end
  end

  describe('#update') do
  it("adds an album to an artist") do
    artist = Artist.new({:name => "John Coltrane", :id => nil})
    artist.save()
    album = Album.new({:name => "A Love Supreme", :id => nil})
    album.save()
    artist.update({:album_name => "A Love Supreme"})
    expect(artist.albums).to(eq([album]))
  end
end

  describe('#songs') do
    it("returns an artist's songs") do
      artist = Artist.new({:name => "Outkast", :id => nil})
      artist.save()
      song = Song.new({:name => "Naima", :artist_id => artist.id, :id => nil})
      song.save()
      song2 = Song.new({:name => "Cousin Mary", :artist_id => artist.id, :id => nil})
      song2.save()
      expect(artist.songs).to(eq([song, song2]))
    end
  end

  describe('#delete') do
    it("deletes an artist by id") do
      artist = Artist.new({:name => "Outkast", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Blue October", :id => nil})
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end


end