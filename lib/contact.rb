class Contact
  @@list = []
  attr_accessor :first_name, :last_name
  attr_reader :id

  # def first_name  reader attr
  #   @first_name
  # end

  # def first_name(first_name)  writer attr
  #   @first_name = first_name
  # end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @id = @@list.length + 1
  end

  def self.all #this refers to all the items in the @@list
    @@list
  end

  # def self.find()
  #   @@list.all? do |contact|
  #    contact.first_name == contact.self
  #       return contact
  #   end
  # end

  def self.find(id) #class methods
    contact_id = id.to_i()
    @@list.each do |contact|
      if contact.id == contact_id
        return contact
      end
    end
  end

  def save
    # @@list.each do |contact|
      @@list.push(self)
  end

  def self.clear()
    @@list = []
  end

  def self.sort
    @@list.sort_by! {|contact| contact.last_name}
  end



end
