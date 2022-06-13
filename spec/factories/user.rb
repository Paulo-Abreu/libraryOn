# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'email@email.com' }
    password { '12345678' }
    username { 'username' }
  end
end
