require('rspec')
require('pry')
require('contact')

describe("Contact") do
  before() do
      Contact.clear()
    end

describe("#save") do
    it("save a contact to a list") do
      contact1 = Contact.new("Margaret", "Pineapple")
      contact1.save()
      expect(Contact.all()).to(eq([contact1]))
    end
  end

describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      contact1 = Contact.new("Margaret", "Pineapple")
      contact1.save()
      contact2 = Contact.new("Javier", "Beast")
      contact2.save()
      expect(contact1.id()).to(eq(1))
      expect(contact2.id()).to(eq(2))
    end
  end
end
