FactoryBot.define do
  factory :gym do
    name { "test" }
    content { "tester" }
    picture { [ Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png'), 'app/assets/images/test.png') ]}
    association :user
  end
end




