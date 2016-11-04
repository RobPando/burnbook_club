FactoryGirl.define do
  factory :user do
    name 'example'
    email 'user@example.com'
    password 'foobar'
    password_confirmation 'foobar'
    member false
  end

end
