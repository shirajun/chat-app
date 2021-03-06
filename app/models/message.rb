class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image
  #Messagesテーブルの各レコードと画像ファイルを管理するimageカラムの紐付け

  validates :content, presence: true, unless: :was_attached?
  
  def was_attached?
    self.image.attached?
  end
end
