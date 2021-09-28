FactoryBot.define do
  factory :cookbook_recipe, class: 'Cookbook::Recipe' do
    name { "MyString" }
    description { "MyString" }
    preparion { "MyText" }
  end
end
