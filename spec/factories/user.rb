FactoryGirl.define do
  factory :user do
    name 'Petronilo'
    is_publisher true
    sequence(:email) { |n| "petronilo_#{ n }@crowdint.com" }
  end
end
