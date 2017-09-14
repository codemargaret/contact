require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')


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
  contact = Contact.new(first_name, last_name)
  contact.save()
  @list = Contact.sort()
  erb(:list)
end
