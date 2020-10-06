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
      artist2 = Artist.new({:name => "Big Chungus", :id => nil})
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

end