# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'title' }
    description  { 'description' }
    user {}
  end
end
