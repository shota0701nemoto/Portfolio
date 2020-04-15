FactoryBot.define do
  factory :gym do
    name { "test" }
    content { "tester" }
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, "app/assets/images/test.png"))}
  end
end
