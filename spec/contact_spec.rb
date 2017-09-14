require('rspec')
require('pry')
require('contact')

describe("Contact") do
  before() do
      Contact.clear()
    end

describe("#save") do
    it("save a contact to a list") do
      contact1 = Contact.new({"first_name" => "Margaret", "last_name" => "Pineapple", "address" => "123 Main St", "phone_number" => "555-555-5555"})
      contact1.save()
      expect(Contact.all()).to(eq([contact1]))
    end
  end

describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      contact1 = Contact.new({"first_name" => "Margaret", "last_name" => "Pineapple", "address" => "123 Main St", "phone_number" => "555-555-5555"})
      contact1.save()
      contact2 = Contact.new({"first_name" => "Javier", "last_name" => "Beast", "address" => "123 Main St", "phone_number" => "555-555-5555"})
      contact2.save()
      expect(contact1.id()).to(eq(1))
      expect(contact2.id()).to(eq(2))
    end
  end

  describe(".sort") do
    it('put contacts in alphabetical order') do
      contact1 = Contact.new({"first_name" => "Margaret", "last_name" => "Pineapple", "address" => "123 Main St", "phone_number" => "555-555-5555"})
      contact1.save()
      contact2 = Contact.new({"first_name" => "Javier", "last_name" => "Beast", "address" => "123 Main St", "phone_number" => "555-555-5555"})
      contact2.save()
      contact3 = Contact.new({"first_name" => "Dawson", "last_name" => "Awesome", "address" => "Epicodus", "phone_number" => "555-555-5555"})
      contact3.save()
      Contact.sort()
      expect(Contact.all()).to(eq([contact3,contact2,contact1]))
    end
  end
end
