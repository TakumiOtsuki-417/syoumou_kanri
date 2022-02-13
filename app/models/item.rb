class Item < ApplicationRecord

  # attr_accessor :name, :date, :price, :amount, :from_id, :genre_id, :comment
# 上のやつを作動させると何故かエラーになるのでコメントアウトしとく

  #バリデーション
  with_options presence: true do
    validates :name
    validates :date
    with_options numericality: {only_integer: true, message: 'is invalid. Input half-width characters'} do
      validates :price
      validates :amount
    end
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :genre_id
    end
    validates :from_id
  end

  #アソシエーション
  has_many :damages

  #アクティブハッシュ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :from
end
