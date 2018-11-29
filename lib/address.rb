class Address

  attr_accessor(:city, :street_address, :zip, :phone_number)

  def initialize(address)
    @city = address.fetch(:city)
    @street_address = address.fetch(:street_address)
    @zip = address.fetch(:zip)
    @phone_number = address.fetch(:phone_number)
  end

end
