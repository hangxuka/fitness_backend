class Manager < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :users
  has_many :meetings
  has_many :items
  has_many :orders

  before_save :set_birthday
  mount_base64_uploader :avatar, AvatarUploader

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  private
  def set_birthday
    self.birthday = (DateTime.parse self.birthday)
      .strftime I18n.t("api.birthday_date_format") if self.birthday
  end
end
