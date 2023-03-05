# frozen_string_literal: true

class BookImportService

  def initialize(file)
    @file = file
  end

  def import
    csv = CSV.parse(@file, headers: true)

    csv&.each do |row|
      BookImportJob.perform_later(row.to_h)
    end
  end
end
