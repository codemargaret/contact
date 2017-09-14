require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe("Contact") do
#   before() do
#       Contact.clear()
#     end

  describe('my contacts', {:type => :feature}) do
    it ('processes the user entry and returns a list of items') do
      visit('/')
      fill_in('first_name', :with => 'margaret')
      fill_in('last_name', :with => 'kitten')
      click_button('add contact')
      expect(page).to have_content('margaret')
    end
  end

  # describe('a contact', {:type => :feature}) do
  #   it ('lists the first name') do
  #     visit('/contact/1')
  #     expect(page).to have_content('margaret kitten')
  #   end
  # end

  describe('a contact', {:type => :feature}) do
    it ('goes to the detail page') do
      visit('/')
      save_and_open_page
      click_link("kitten margaret")
      expect(page).to have_content('margaret')
    end
  end
# end
