FactoryBot.define do
  factory :user do
    
    name                           {Faker::Name.name}
    email                          {Faker::Internet.free_email}
    password                       {'1a' + Faker::Internet.password(min_length: 6)}    # 「'1a'」の追加で、passwordのバリデーションである半角英数字に対応できる
    password_confirmation          {password}
    company_id                     {2}
    birthday                       {Faker::Date.birthday}

  end
end
