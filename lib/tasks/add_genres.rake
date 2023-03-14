# frozen_string_literal: true

namespace :db do
  desc 'Add genres to the site'
  task add_genres: :environment do
    csv_text = Rails.root.join('lib', 'seeds', 'genres.csv').read

    csv = CSV.parse(csv_text, headers: true)

    genre = nil

    csv&.each do |row|
      name_en = row['name_en']
      name_ru = row['name_ru']
      parent_id = row['parent_id']

      if parent_id == 'NULL'
        genre = Genre.create!(name_ru:, name_en:)
      else
        begin
          Genre.find_or_create_by!(name_ru:, name_en:, parent: genre)
        rescue ActiveRecord::RecordNotUnique => e
          Rails.logger.debug { "Record already exists: #{e.message}" }
        end
      end
    end
  end
end
