require './lib/budget'
require './lib/department'
require './lib/employee'
require 'rspec'

RSpec.describe Budget do 
  before(:each) do 
    @budget = Budget.new("2023")

    @customer_service = Department.new("Customer Service")
    @bidness = Department.new("Bidness")

    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
    @corn_puff = Employee.new({name: "Corn Puff", age: "136", salary: "$5"})
    @froot_loop = Employee.new({name: "Froot Loop", age: "444", salary: "$9"})
    @pringle = Employee.new({name: "Pringle Potato Crisp", age: "321", salary: "$13"})

    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)

    @bidness.hire(corn_puff)
    @bidness.hire(froot_loop)
    @bidness.hire(pringle)
  end

  describe "initialize" do 
    it "exists and has attributes" do 
      expect(@budget).to be_a(Budget)
      expect(@budget.year).to eq("2023")
      expect(@budget.departments).to eq([])
    end
  end
end

