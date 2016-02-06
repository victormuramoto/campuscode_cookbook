FactoryGirl.define do
  factory :food_type do
    name 'Entrada'
  end
end

FactoryGirl.define do
  factory :admin do
    email 'victor.muramoto@gmail.com'
    password '12345678'
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
    name 'Strognoff de Frango'
    number_people 6
    time_prepare  45
    difficult 'Facil'
    ingredients 'frango e cebola'
    description 'misture tudo e aqueça'
    food_type
    food_preference
    kitchen
  end
FactoryGirl.define do
  factory :other_recipe do
    name 'Crepe de nutella'
    number_people 1
    time_prepare  10
    difficult 'Facil'
    ingredients 'Nutella Farinha e ovo'
    description 'jogue tudo na panela e vire'
    food_type
    food_preference
    kitchen
  end
end
end
