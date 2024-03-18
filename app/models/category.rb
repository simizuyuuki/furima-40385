class Category < ActiveHash::Base
  self.data = [
    { id: 1, category: '---' },
    { id: 2, category: 'メンズ' },
    { id: 3, category: 'レディース' },
    { id: 4, category: 'ベビー・キッズ' },
    { id: 5, category: 'インテリア・住まい・小物・本・音楽・ゲーム' },
    { id: 6, category: 'おもちゃ・ホビー・グッズ' },
    { id: 7, category: '家電・スマホ・カメラ' },
    { id: 8, category: 'スポーツ・レジャー' },
    { id: 9, category: 'ハンドメイド' },
    { id: 10, category: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
