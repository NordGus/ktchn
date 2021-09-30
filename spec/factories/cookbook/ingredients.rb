FactoryBot.define do
  factory :cookbook_ingredient, class: 'Cookbook::Ingredient' do
    cookbook_recipe { nil }
    inventory_item { nil }
    inventory_unit { nil }
    amount { "9.99" }
  end
end
