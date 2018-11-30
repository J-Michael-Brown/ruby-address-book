require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact.rb')
require('./lib/address.rb')
require('pry')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

get('/add_contact') do
  erb(:add_contact)
end

post('/add_contact') do
@first_name = params.fetch("contact-first-name")
@last_name = params.fetch("contact-last-name")
@job_title = params.fetch("contact-job-title")
@company = params.fetch("contact-company")
@contact_type = params.fetch("contact-type")

 new_contact = Contact.new({:first_name => @first_name, :last_name => @last_name, :job_title => @job_title, :company => @company, :contact_type => @contact_type})
 Contact.add_contact(new_contact)

 erb(:add_contact)
end

get('/contacts/:id') do
  @contact = Contact.find(params[:id])
  Contact.current_id(@contact.id().to_s)
  erb(:contacts)
end

get('/add_address/:id') do
  @contact = Contact.find(params[:id])
  erb(:add_address)
end

post('/add_address/:id') do
  @contact = Contact.find(params[:id])
  @street = params.fetch('contact-street')
  @city = params.fetch('contact-city')
  @zip = params.fetch('contact-zip')
  @phone = params.fetch('contact-phone')

  temp_address = Address.new({:street_address => @street, :city => @city,:zip => @zip, :phone_number => @phone})

  Contact.add_address(temp_address, @contact)
  erb(:add_address)
end
