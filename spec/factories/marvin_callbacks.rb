# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :marvin_callback do
    raw_xml "MyString"
    import_status "MyString"
    import_status_details "MyString"
    guid "MyString"
    orig_stamp "MyString"
  end
end
