FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'abc123'}
    password_confirmation {password}
    family_name           {'池上'}
    family_name_kana      {'イケガミ'}
    first_name            {'那奈'}
    first_name_kana       {'ナナ'}
    birth_day             {'1990-09-19'}
  end
end