# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :paragraph do
    document FactoryGirl.create(:document, title:"The Very Sad Tree")
    document_index 1
  end
end
