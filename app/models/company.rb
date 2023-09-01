class Company < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '半導体メーカー' },
    { id: 3, name: '製造業' },
    { id: 4, name: '商社' },
    { id: 5, name: '金融' },
    { id: 6, name: '情報通信' },
    { id: 7, name: '医療・福祉' },
    { id: 8, name: 'サービス' },
    { id: 9, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :users

  end