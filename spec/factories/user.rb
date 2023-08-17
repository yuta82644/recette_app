FactoryBot.define do
  factory :user do
    name { 'test01' }
    email { 'test01@exam.com' }
    password { 'test01' }
    admin { true }
  end

  factory :second_user, class: User do
    name { 'test02' }
    email { 'test02@exam.com' }
    password { 'test02' }
    admin { false }
  end

  factory :third_user, class: User do
    name { 'test03' }
    email { 'test03@exam.com' }
    password { 'test03' }
    admin { true }
  end
end