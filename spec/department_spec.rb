require './lib/department'
require './lib/employee'
require 'rspec'

RSpec.describe Department do 
  before(:each) do 
    @customer_service = Department.new("Customer Service")
  end

  describe "initialize" do 
    it "exists and has a name" do 
      expect(@customer_service).to be_a(Department)
      expect(@customer_service.name).to eq("Customer Service")
    end
  end

  describe "employees" do 
    it "has a list of employees" do 
      expect(@customer_service.employees).to eq([])
    end
  end
end