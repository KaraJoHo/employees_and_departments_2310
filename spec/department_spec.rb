require './lib/department'
require './lib/employee'
require 'rspec'

RSpec.describe Department do 
  before(:each) do 
    @customer_service = Department.new("Customer Service")

    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
  end

  describe "initialize" do 
    it "exists and has a name" do 
      expect(@customer_service).to be_a(Department)
      expect(@customer_service.name).to eq("Customer Service")
      expect(@customer_service.employees).to eq([])
    end
  end

  describe "hire" do 
    it "adds employees to the department" do 
      @customer_service.hire(bobbi)
      @customer_service.hire(aaron)

      expect(@customer_service.employees).to eq([bobbi, aaron])
    end
  end
end