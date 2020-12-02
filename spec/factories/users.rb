FactoryBot.define do
  factory :user do
    nickname              { 'furio' }
    email                 { 'kkk@email.com' }
    password              { 'a00000' }
    password_confirmation { 'a00000' }
    first_name            { 'たけし' }
    family_name           { 'ぜんかく' }
    first_name_kana       { 'カナコ' }
    family_name_kana      { 'ゼンカク' }
    birthday              { '2000-11-11' }
  end
end
