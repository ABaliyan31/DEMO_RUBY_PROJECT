class User < ApplicationRecord
  attr_accessor :remember_token

  before_save { self.email = email.downcase }

  has_many :microposts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, uniqueness: true, presence: true, length: { minimum: 6 }

  VALID_EMAIL_REGEX= /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  validates :email , presence: true,uniqueness:{case_sensetive:false}, format:{with:VALID_EMAIL_REGEX,multiline:true}

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

end
