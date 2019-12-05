FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :character do
    race { "Human" }
    gender {"Male"}
    age {"30"}
    charclass {"Fighter"}
    level {"9999"}
    name {"King"}
    alignment {"Neutral"}
    description {"Description"}
    equipment {"Equipment"}
    spell {"Spell"}
    wealth {"9999999999"}
    strstat {"9999"}
    dexstat {"9999"}
    constat {"9999"}
    intstat {"9999"}
    wisstat {"9999"}
    chastat {"9999"}

    association :user
  end
end