class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable
  has_many :rooms
  has_many :messages
end
