class Genre < ApplicationRecord
  has_many :genre_songs
  has_many :songs, through: :genre_songs

  def average_rating
    songs.average(:number_rating)
  end

end
