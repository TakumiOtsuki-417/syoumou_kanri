class Item < ApplicationRecord


  #アソシエーション

  #アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
