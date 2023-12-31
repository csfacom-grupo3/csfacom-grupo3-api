class News < ApplicationRecord
  extend Enumerize

  enumerize :visibility, in: { visible: 0, draft: 1, invisible: 2 }, default: :draft, predicates: true
  has_many_attached :images

  def images_url
    return [] unless images.attached?

    images.map do |image|
      Rails.application.routes.url_helpers.rails_blob_url(image, host: Rails.application.credentials.dig(Rails.env.to_sym, :app_domain))
    end
  end

end
