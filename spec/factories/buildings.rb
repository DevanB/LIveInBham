# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    name "MyString"
    address "MyString"
    city "MyString"
    state "MyString"
    zip_code_id 1
    latitude 1.5
    longitude 1.5
  end
end
