FactoryBot.define do
    factory :user do
        name { "Anything" }                   
        contact{ "1234567890"}
        email { "abc@gmail.com" }
        password { "1234567890" } 
    end
end