FactoryBot.define do
  factory :scraping_result do
    task_id { Faker::Number.number(digits: 1) }
    user_id { Faker::Number.number(digits: 1) }
    city { Faker::Address.city }
    year { Faker::Vehicle.year }
    km { Faker::Vehicle.mileage }
    transmission { Faker::Vehicle.transmission }
    body_type { Faker::Vehicle.car_type }
    fuel { Faker::Vehicle.fuel_type }
    final_plate { Faker::Vehicle.license_plate }
    color { Faker::Color.color_name }
    trade { 'Trade-in' }
  end
end
