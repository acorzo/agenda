namespace :utils do
  desc "Agregando datos de prueba"
  task seed: :environment do
    10.times do |i|
      Contact.create!(name: Faker::Name.name,
                    email: Faker::Internet.email,
                    kind_id: Kind.all.sample.id,
                    observations: Faker::Lorem.sentence) 
    end
    puts "Contactos generados con éxito"
    
    Contact.all.each do |contact|
      Address.create!(street: Faker::Address.street_address,
                    city: Faker::Address.city,
                    state: Faker::Address.state_abbr,
                    contact_id: contact.id)
    end
    puts "Direcciones generadas con éxito"
    
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(number: Faker::PhoneNumber.cell_phone, contact_id: contact.id)
      end
    end
    puts "Teléfonos generados con éxito"
  end
end
