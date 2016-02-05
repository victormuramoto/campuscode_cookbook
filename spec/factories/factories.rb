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
    difficult "Facil"
    ingredients "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    description "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    food_type
    food_preference
    kitchen
  end


end
