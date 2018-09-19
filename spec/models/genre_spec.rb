require 'rails_helper'

describe Genre, type: :model do
  describe 'relationships' do
    it {should have_many(:genre_songs)}
    it {should have_many(:songs).through(:genre_songs)}
  end
  describe 'class methods' do
    it 'calcualtes average rating for songs in a given genre' do
    genre_1 = Genre.create!(name: 'Hip Hop')
    artist_1 = Artist.create!(name: 'Afroman')
    artist_2 = Artist.create!(name: 'Beasty Boys')
    genre_2 = Genre.create!(name: 'country')
    song_1 = genre_1.songs.create!(title: 'colt 45', length: 100, play_count: 100, artist_id: artist_1.id, number_rating: 4)
    song_2 = genre_1.songs.create!(title: 'Because I Got High', length: 100, play_count: 100, artist_id: artist_1.id, number_rating: 4)
    song_3 = genre_1.songs.create!(title: 'Paul Revere', length: 100, play_count: 100, artist_id: artist_2.id, number_rating: 4)
    song_4 = genre_2.songs.create!(title: 'Hurt', length: 100, play_count: 100, artist_id: artist_2.id, number_rating: 1)
    song_1.genre_songs.create!(genre: genre_1)
    song_2.genre_songs.create!(genre: genre_1)
    song_3.genre_songs.create!(genre: genre_1)

    expect(genre_1.average_rating).to eq(4)
  end
  end
end
