# frozen_string_literal: true

module AttachableImage
  extend ActiveSupport::Concern

  included do
    def download_image(attr, image_url)
      file = Down.download(image_url)
      filename = File.basename(image_url)
      send(attr).attach(io: file, filename: "#{filename}.jpeg", content_type: 'image/jpeg')
    end
  end
end
