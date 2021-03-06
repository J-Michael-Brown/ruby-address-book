require ('contact')
require ('address')
require ('rspec')
require ('pry')

describe('.contact') do
  describe('#initialize') do
    it('allows you to read and rewrite all info, except the contact id which can only be read.') do
      tester = Contact.new({:first_name => "michael", :last_name => "brown", :job_title => "student", :company => "epicodus", :contact_type => "casual"})
      expect(tester.first_name()).to(eq("michael"))
      expect(tester.id).to eq(-1)
      expect(tester.assign_id).to eq(1)
    end
  end
  describe('#add_contact') do
    it('Add new contact to list') do
      tester = Contact.new({:first_name => "Cinderella", :last_name => "brown", :job_title => "student", :company => "epicodus", :contact_type => "casual"})
      Contact.add_contact(tester)
      expect(Contact.all.include?(tester)).to(eq(true))
    end

  end

  describe('#make_address') do
    it "adds an address object to the contact" do
      tester = Contact.new({:first_name => "Cinderella", :last_name => "brown", :job_title => "student", :company => "epicodus", :contact_type => "casual"})
      test_address = Address.new({:city=> "portland", :street_address=> "main street", :zip=> "97219", :phone_number=> "555-1234"})
      expect(tester.make_address(test_address)).to eq(tester.address)
      expect(tester.address).to eq(test_address)
    end
  end

  describe('#self.find') do
    it "returns a copy of the contact in the @@contact list, using a string version of an id" do
      find_tester = Contact.new({:first_name => "Cinderella", :last_name => "brown", :job_title => "student", :company => "epicodus", :contact_type => "casual"})
      Contact.add_contact(find_tester)
      find_tester_check = Contact.find(find_tester.id.to_s) #returning as an array
      expect(find_tester).to eq(find_tester_check)

    end
  end




end
