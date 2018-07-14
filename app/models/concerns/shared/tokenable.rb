module Shared::Tokenable
  extend ActiveSupport::Concern

  included do
    validates :token, length: { is: 16 }, format: { with: /\A[+-]?\d+\Z/ }, allow_nil: true

    before_create { set_token }

    def set_token!
      return if token.present?
      self.token = nil
      token_will_change!
      set_token
      save(validate: false)
    end

    def set_token
      if token.blank?
        until acceptable_token
          self.token = SecureRandom.random_number.to_s.slice(2, 17)
        end
      end
      self.token
    end

    def acceptable_token
      return false if token.blank? || (token[0] == '0') || (token.length != 16)
      return false if self.class.where(token: token).first
      true
    end
  end
end