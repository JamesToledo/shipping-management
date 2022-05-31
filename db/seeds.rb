# frozen_string_literal: true

company = Company.create!(brand_name: 'Apple', corporate_name: 'Apple Inc.', registration_number: '00623904000173',
                          email_domain: 'apple.com', address: 'Rua Leopoldo Couto de Magalhães Jr., 700',
                          postal_code: '04542-000', state_abbr: 'sc')

User.create!(username: 'Pedrinho', email: "pedrinho@#{company.email_domain}", password: 'Pedrinho123')

User.create!(username: 'Paula', email: 'paula@sistemadefrete.com', password: 'Paula123')

Vehicle.create!(vehicle_model: 'cargo 1317', vehicle_make: 'ford', vehicle_plate: 'EPP-5432',
                year: '2010', load_capacity: 3000, company_id: company.id)

Budget.create!(min_size: 0.001, max_size: 0.500, min_weight: 0, max_weight: 10,
               range_price: 0.50, company_id: company.id)

ShippingCust.create!(value: 15, company_id: company.id)

Deadline.create!(min_space: 0, max_space: 100, days: 2, company_id: company.id)

order = FactoryBot.create(:order, company_id: company.id)

FactoryBot.create(:pickup_location, order_id: order.id)

FactoryBot.create(:client, order_id: order.id)
