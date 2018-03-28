FactoryBot.define do
  factory :make, aliases: [:jeep] do
    name 'Jeep'
  end

  factory :model, aliases: [:wrangler] do
    name 'Wrangler'
    make { Make.where(name: 'Jeep').first_or_create }
  end

  factory :option, aliases: [:seat_warmers] do
    name 'Seat warmers'
  end

  factory :vehicle do
    make
    model
    year 2009
    description "A fine car for the mountains."
  end
end