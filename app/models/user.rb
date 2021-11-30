class User < ApplicationRecord
  before_save{:email_downcase}

  validates :name, presence: true,
    length: {maximum: Settings.length.name}

  validates :email, presence: true,
    length: {maximum: Settings.length.email},
    format: {with: Settings.regex.email_regex},
    uniqueness: true

  validates :password, presence: true,
    length: {minimum: Settings.length.password}
  validate :valid_birthday, if: ->{birthday.present?}

  has_secure_password

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end
  end

  private

  def valid_birthday
    return if Date.parse(birthday) > Settings.length.date.year.ago

    errors.add(:birthday, I18n.t("error.invalid"))
  end

  def email_downcase
    email.downcase!
  end
end
