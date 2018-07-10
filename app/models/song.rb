class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(id)
    self.genre = Genre.find(id)
  end

  def genre_name
    binding.pry
    self.genre ? self.genre.name : nil
  end

  def note_contents=(ids)
    ids.each do |id|
      note = Notes.find(id)
      self.notes << note
    end
  end

  def note_contents
    note_contents = []
    self.notes.each do |note|
      note_contents << note.content if note.content != nil
    end
    note_contents
  end



end
