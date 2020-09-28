class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true
  #ルーム名が存在presenceしている場合のみ作成可true
end
