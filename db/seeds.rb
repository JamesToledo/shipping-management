# frozen_string_literal: true

company = Company.create!(brand_name: 'Apple', corporate_name: 'Apple Inc.', registration_number: '00623904000173',
                          email_domain: 'apple.com', address: 'Rua Leopoldo Couto de Magalhães Jr., 700',
                          postal_code: '04542-000', state_abbr: 'sc')

User.create!(username: 'Pedrinho', email: "pedrinho@#{company.email_domain}", password: 'Pedrinho123')

User.create!(username: 'Paula', email: 'paula@sistemadefrete.com', password: 'Paula123')

Vehicle.create!(vehicle_model: 'cargo 1317', vehicle_make: 'ford', vehicle_plate: 'EPP-5432',
                year: '2010', load_capacity: 3000, company_id: company.id)
