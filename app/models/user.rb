class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "英数字をそれぞれ含めてください" }
  validates :nickname, presence: true
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角を入力してください' }
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角を入力してください' }
  validates :family_name_kana, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角カナを入力してください' }
  validates :first_name_kana, format: { with: /\A[ァ-ヶ一]+\z/, message: '全角カナを入力してください'}
  validates :birth_day, presence: true

  #has_many :items
  #has_many :purchases
end