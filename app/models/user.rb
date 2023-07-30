class User < ApplicationRecord

  before_save { self.email = email.downcase }

  has_many :microposts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  VALID_EMAIL_REGEX= /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  validates :email , presence: true,uniqueness:{case_sensetive:false}, format:{with:VALID_EMAIL_REGEX,multiline:true}

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }

end
