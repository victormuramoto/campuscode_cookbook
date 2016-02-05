FactoryGirl.define do
  factory :food_type do
    name 'Entrada'
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
end
