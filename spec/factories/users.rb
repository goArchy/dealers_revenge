FactoryGirl.define do
  factory :user do
    name 'John Smith'
    email 'testexample@example.org'
    password 'password'
    password_confirmation 'password'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

  factory :event do
    description "Lorem Ipsum"
    first_name "Bilbo"
    last_name "Baggins"
    dob 555555
    ssn 5155
    user
  end
end
