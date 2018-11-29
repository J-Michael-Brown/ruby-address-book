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
 new_contact.add_contact

 erb(:contacts)
end

get('/contacts/:id') do
  @contact = Contact.find(params[:id])
  erb(:contacts)
end
