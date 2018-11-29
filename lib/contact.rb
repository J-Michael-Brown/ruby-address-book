class Contact
  attr_accessor(:first_name, :last_name, :job_title, :company, :contact_type, :address)
  attr_reader(:id)

  @@contacts = []
  @@next_id = 0

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @contact_type = attributes.fetch(:contact_type)
    @id = -1
  end

  def add_address(address_object)
    @address = address_object
  end

  def assign_id
    @@next_id += 1
    @id = @@next_id
  end

  def self.all
    @@contacts
  end

  def add_contact
    @@contacts.push(self)
  end

end
