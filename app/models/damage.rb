class Damage < ApplicationRecord
  #バリデーション
  with_options presence: true do
    validates :date
    with_options numericality: {only_integer: true, message: 'is invalid. Input half-width characters'} do
      validates :amount
    end
  end

  #アソシエーション
  belongs_to :item

end
