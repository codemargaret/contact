class Contact
  @@list = []
  attr_accessor :first_name, :last_name, :address, :phone_number
  attr_reader :id

  def initialize(attributes)
    @first_name = attributes.fetch("first_name")
    @last_name = attributes.fetch("last_name")
    @address = attributes.fetch("address")
    @phone_number = attributes.fetch("phone_number")

    @id = @@list.length + 1
  end

  def self.all
    @@list
  end

  def self.find(id)
    contact_id = id.to_i()
    @@list.each do |contact|
      if contact.id == contact_id
        return contact
      end
    end
  end

  def save
      @@list.push(self)
  end

  def self.clear()
    @@list = []
  end

  def self.sort
    @@list.sort_by! {|contact| contact.last_name}
  end

  def self.remove_contact(id)
    @@list.map do |contact|
      if contact.id == id
        contact.first_name = ""
        contact.last_name = ""
      end
    end
  end
end
