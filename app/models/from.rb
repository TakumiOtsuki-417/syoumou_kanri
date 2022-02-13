class From < ActiveHash::Base
  self.data = [
    { id: 1, name: 'たまや' },
    { id: 2, name: 'マックスバリュー' },
    { id: 3, name: 'コープ' },
    { id: 4, name: 'ラスカ系統' },
    { id: 5, name: 'その他' }
  ]

  #アソシエーション
  include ActiveHash::Associations
  has_many :items
  end