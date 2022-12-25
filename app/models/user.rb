class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_one_attached :profile_image #画像の投稿　メソッドを定義している。
 has_many:books, dependent: :destroy#1:N

  validates:name, length: {minimum:2, maximum: 20 }, uniqueness: true
  validates:introduction, length: {maximum: 50 }
#sign inも、Editも、Createもテーブルにアップロードをするだから、エディットのエラーが出た。

  def get_profile_image(width,height)#画像を扱うにあたっての流れ
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
