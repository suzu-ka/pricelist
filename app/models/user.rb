class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item
  has_many :comments, dependent: :destroy

  validates :user_name, presence: true
  validates :profile, length: { maximum: 200 }

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end

  mount_uploader :image, ImageUploader

end
