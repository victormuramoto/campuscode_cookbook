FactoryGirl.define do
  sequence :name do |n|
    "Strogonoff de frango#{n}"
  end
end
FactoryGirl.define do
  factory :food_type do
    name 'Entrada'
  end
end

FactoryGirl.define do
  factory :user_recipe do
    recipe_id 1
    user_id   1
  end
end

FactoryGirl.define do
  factory :kitchens_user do
    kitchen_id 1
    user_id   1
  end
end

FactoryGirl.define do
  factory :admin do
    email 'victor.muramoto@gmail.com'
    password '12345678'
  end
end

FactoryGirl.define do
  factory :user do
    email 'victor.muramoto@gmail.com'
    password '12345678'
    password_confirmation '12345678'
    first_name 'Victor'
    last_name 'muramoto'
    city 'São Paulo'
    facebook 'www.facebook.com.br'
    twitter 'www.twitter.com.br'
  end
end

FactoryGirl.define do
  factory :food_preference do
    name 'Frango'
  end
end

FactoryGirl.define do
  factory :kitchen do
    name 'Paulista'
  end
end

FactoryGirl.define do
  factory :recipe do
    name
    number_people 6
    time_prepare  45
    difficult 'Facil'
    ingredients 'frango e cebola'
    description 'misture tudo e aqueça'
    food_type
    food_preference
    kitchen
    user
  end
end
