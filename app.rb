require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')

get('/') do
  erb(:index)
end

post('/add_contact') do
@first_name = params.fetch("contact-first-name")
@last_name = params.fetch("contact-last-name")
@job_title = params.fetch("contact-job-title")
@company = params.fetch("contact-company")
@contact_type = params.fetch("contact-type")
# @phone_number = params.fetch("contact-phone-number")
# @city =
# @street_address =
# @zip =

 new_contact = Contact.new({:first_name => "", :last_name => "", :job_title => "", :company => "", :contact_type => "", :phone_number => ""})


end
