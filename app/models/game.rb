class HttpUrlValidator < ActiveModel::EachValidator

    def self.compliant?(value)
      uri = URI.parse(value)
      uri.is_a?(URI::HTTP) && !uri.host.nil?
    rescue URI::InvalidURIError
      false
    end
  
    def validate_each(record, attribute, value)
      unless value.present? && self.class.compliant?(value)
        record.errors.add(attribute, "is not a valid HTTP URL")
      end
    end
  
end

class Game < ApplicationRecord
    has_many :comments
    validates :title, presence: true, length: {
        maximum: 30
    }
    validates :about, presence: true, length: {
        minimum: 10,
        maximum: 200
    }
    validates :img_path, presence: true, http_url: true
    before_save :titleize_game_title

    private
    def titleize_game_title
      self.title = title.downcase.titleize
    end
end
