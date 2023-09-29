class Case < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '「在庫」が「増加」したとき' },
    { id: 3, name: '「在庫」が「減少」したとき' },
    { id: 4, name: '「在庫」が「増加または減少」したとき' },
    
  ]

  include ActiveHash::Associations
  has_many :reminders

  end