class User < ApplicationRecord
  has_secure_password
  #simple authenticaiton support with pass_word digest column
  #auto validates email and password

  has_many :screenshots

  validates_uniqueness_of :email
end
