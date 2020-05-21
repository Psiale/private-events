FactoryBot.define do

    # A sequence is used when you have a uniqueness validation
    sequence :name do |n|
        "Alexis#{n}"
    end

    factory :user do
        # you use generate to call the sequence
      name  { generate(:name) }
    end


    factory :event do
        association :host
        location  { "Somewhere" }
        time  { DateTime.now + 2.day }
    end
end