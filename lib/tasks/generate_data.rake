desc 'Generates sample data in the database'
task generate_data: :environment do
  abort 'You have not passed N parameter!' if ENV['N'].blank?
  Rake::Task['db:reset'].execute if Rails.env.development?
  ENV['N'].to_i.times do
    address = Address.create(city: Faker::Address.city, street: Faker::Address.street_name)
    user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address_id: address.id)
    post = Post.create(body: Faker::Lorem.sentence, user_id: user.id)
  end
  puts 'The sample data have been created!'
end
