class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '朝食系' },
    { id: 3, name: '野菜' },
    { id: 4, name: '冷凍メイン' },
    { id: 5, name: '冷凍サブ' },
    { id: 6, name: '肉・魚' },
    { id: 7, name: '加工品メイン' },
    { id: 8, name: '加工品サブ' },
    { id: 9, name: 'お菓子' },
    { id: 10, name: '贅沢飲料' }
  ]

  #アソシエーション
  include ActiveHash::Associations
  has_many :items
  end