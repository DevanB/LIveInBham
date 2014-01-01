# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit do
    featured false
    number "MyString"
    avail_date "2013-12-31"
    category nil
    building nil
    title "MyString"
    description "MyText"
    bedrooms 1
    bathrooms 1
    price "9.99"
    link "MyString"
    image "MyString"
  end
end
