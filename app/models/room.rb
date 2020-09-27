class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users

  validates :name, presence: true
  #ルーム名が存在presenceしている場合のみ作成可true
end
