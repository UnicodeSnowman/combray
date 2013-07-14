
FactoryGirl.define do
  factory :user do
    email "caplingerc@gmail.com"
    password "testpass"
    password_confirmation "testpass"

    factory :admin_user do
      admin true
    end
  end
end
