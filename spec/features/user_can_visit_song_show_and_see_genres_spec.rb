require 'rails_helper'

describe 'as a user' do
  context 'visit song show page' do
    it 'displays the generes for the given song' do
      genre_1 = Genre.create!(name: 'Hip Hop')
      artist_1 = Artist.create!(name: 'Afroman')
      artist_2 = Artist.create!(name: 'Beasty Boys')
      genre_2 = Genre.create!(name: 'country')
      song_1 = genre_1.songs.create!(title: 'colt 45', length: 100, play_count: 100, artist_id: artist_1.id)
      song_2 = genre_1.songs.create!(title: 'Because I Got High', length: 100, play_count: 100, artist_id: artist_1.id)
      song_3 = genre_1.songs.create!(title: 'Paul Revere', length: 100, play_count: 100, artist_id: artist_2.id)
      song_3.genres.create!(name: "rock")

      visit song_path(song_3.slug)

      expect(page).to have_content(song_3.genres.first.name)
      expect(page).to have_content(song_3.genres.last.name)
      expect(page).to_not have_content(genre_2.name)

      end
    end
  end
