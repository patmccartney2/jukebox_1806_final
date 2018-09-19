require 'rails_helper'

describe 'as a user' do
  context 'visit song show page' do
    it 'displays the generes for the given song' do
      genre_1 = Genre.create!(name: 'Hip Hop')
      artist_1 = Artist.create!(name: 'Afroman')
      artist_2 = Artist.create!(name: 'Beasty Boys')
      genre_2 = Genre.create!(name: 'country')
      song_1 = genre_1.songs.create!(title: 'colt 45', length: 100, play_count: 100, artist_id: artist_1.id, number_rating: 4)
      song_2 = genre_1.songs.create!(title: 'Because I Got High', length: 100, play_count: 100, artist_id: artist_1.id, number_rating: 4)
      song_3 = genre_1.songs.create!(title: 'Paul Revere', length: 100, play_count: 100, artist_id: artist_2.id, number_rating: 4)
      song_4 = genre_2.songs.create!(title: 'Hurt', length: 100, play_count: 100, artist_id: artist_2.id, number_rating: 1)


      visit genre_path(genre_1)

      expect(page).to have_content("Average Song Rating: 4")

    end
  end
end
