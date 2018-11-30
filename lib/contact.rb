class Contact
  attr_accessor(:first_name, :last_name, :job_title, :company, :contact_type, :address)
  attr_reader(:id)

  @@contacts = []
  @@next_id = 0
  @@current_id = "1"

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @contact_type = attributes.fetch(:contact_type)
    @id = -1
    @address = false
  end

  def make_address(address_object)
    @address = address_object
  end

  def self.add_address(address_object, check)
    @@contacts.each_with_index do |contact, i|
      if check == contact
        @@contacts[i].make_address(address_object)
      end
    end
  end

  def assign_id
    @@next_id += 1
    @id = @@next_id
  end

  def self.find_by_id(id)
    check = self.find(id)
    @@contacts.each_with_index do |contact, i|
      if contact == check
        return i
      end
    end
    false
  end

  def self.find(id)
    contact_id = id.to_i()
    @@current_id = id
    @@contacts.each_with_index do |contact, index|
      if contact.id == contact_id
        return @@contacts[index]
      end
    end
  end

  def self.current_id(new_current_id = @@current_id)
    @@current_id = new_current_id
  end

  def self.all
    @@contacts
  end

  def self.add_contact(contact)
    contact.assign_id
    @@contacts.push(contact)
  end

end
