class User < ApplicationRecord
  has_many :videos
  has_many :screenshots
end
