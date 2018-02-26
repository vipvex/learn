FactoryBot.define do
  factory :blog do
    title 'Super awesome title'
    body 'Lots of content and stuff.'
    
    user
  end
end