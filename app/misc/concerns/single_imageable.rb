module SingleImageable
  extend ActiveSupport::Concern

  included do
    has_one_attached :image
    include Rails.application.routes.url_helpers
    include ActionView::Helpers::AssetUrlHelper

    def thumb_sm_link
      self.image.attached? ? rails_blob_url(self.image.representation(resize_to_limit: [300, 300]).processed , host: self.get_host) : self.get_default_image
    end

    def thumb_md_link
      self.image.attached? ? rails_blob_url(self.image.representation(resize_to_limit: [600, 600]).processed , host: self.get_host) : self.get_default_image
    end

    def image_link
      self.image.attached? ? rails_blob_url(self.image , host: self.get_host) : self.get_default_image
    end

    @private
    def get_host
      Rails.env == 'production' ? 'https://emmanuellugadilu.com' : 'http://localhost:3000'
    end
    
    def get_default_image
      ActionController::Base.helpers.asset_url('default.jpg', host: self.get_host)
    end
  end
end
