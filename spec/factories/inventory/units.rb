FactoryBot.define do
  factory :inventory_unit, class: 'Inventory::Unit' do
    name { "MyString" }
    category { 1 }
  end
end
