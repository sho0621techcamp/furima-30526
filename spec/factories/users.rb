FactoryBot.define do
  factory :user do
    transient do
      person  {Gimei.name}
    end
      nickname {Faker::Name.name}
      email    {Faker::Internet.free_email}
      password {"fgh4657"}
      password_confirmation {password}
      first_name_kanji {person.first}
      last_name_kanji {person.last}
      first_name_kana {person.first.katakana}
      last_name_kana  {person.last.katakana}
      birthday        {"1996-01-01"}
  end
end