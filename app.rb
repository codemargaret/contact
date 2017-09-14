require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('pry')


get('/') do
  @list = Contact.all()

  erb(:list)
end

get('/contact/:id') do
  @contact = Contact.find(params[:id])

  erb(:contact)
end

post('/') do
  first_name = params["first_name"]
  last_name = params["last_name"]
  address = params["address"]
  phone_number = params["phone_number"]


  contact_list = {"first_name" => first_name, "last_name" => last_name, "address" => address, "phone_number" => phone_number}

  contact = Contact.new(contact_list)
  contact.save()
  @list = Contact.all()
  erb(:list)
end
