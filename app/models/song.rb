class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist_name = Artist.find_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end
end
