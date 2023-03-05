# frozen_string_literal: true

module AttachableImage

  extend ActiveSupport::Concern

  included do

    def download_image(attr, image_url)
      file = Down.download(image_url)
      filename = File.basename(image_url)
      send(attr).attach(io: file, filename: "#{filename}.jpeg", content_type: 'image/jpeg')
    end

    private

    def add_default_image(attr, filename)
      return if send(attr).attached?

      send(attr).attach(io: Rails.root.join('app', 'assets', 'images', filename).open,
                        filename:, content_type: 'image/jpeg')
    end
  end
end
