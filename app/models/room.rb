class Room < ActiveHash::Base
  self.data = [
    { id: 1, name: 'キャンプ' },
    { id: 2, name: 'クロージング' },
    { id: 3, name: 'FG' },
    { id: 4, name: 'フィッシング' },
    { id: 5, name: '店舗情報' }
  ]

  include ActiveHash::Associations
  has_many :messages
end