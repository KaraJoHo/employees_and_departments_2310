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
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "$90000"})
    @corn_puff = Employee.new({name: "Corn Puff", age: "136", salary: "$5"})
    @froot_loop = Employee.new({name: "Froot Loop", age: "444", salary: "$9"})
    @pringle = Employee.new({name: "Pringle Potato Crisp", age: "321", salary: "$13"})

    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)

    @bidness.hire(@corn_puff)
    @bidness.hire(@froot_loop)
    @bidness.hire(@pringle)

    @customer_service.expense(200)
    @bidness.expense(600000)
  end

  describe "initialize" do 
    it "exists and has attributes" do 
      expect(@budget).to be_a(Budget)
      expect(@budget.year).to eq("2023")
      expect(@budget.departments).to eq([])
    end
  end

  describe "add_department" do 
    it "adds a department to the budget" do 
      @budget.add_department(@customer_service)

      expect(@budget.departments).to eq([@customer_service])
    end
  end

  describe "departments_with_low_expenses" do 
    it "has a list of departments with expenses below 500" do 
      @budget.add_department(@customer_service)
      @budget.add_department(@bidness)

      expect(@budget.departments_with_low_expenses).to eq([@customer_service])
    end
  end

  describe "employee_salaries" do 
    it "is a list of employees salaries" do 
      @budget.add_department(@customer_service)
      @budget.add_department(@bidness)

      expect(@budget.employee_salaries).to eq([100000, 90000, 5, 9, 13])
    end
  end

  describe "current_expenses_by_department" do 
    it "is a hash of departments and their expenses" do 
      @budget.add_department(@customer_service)
      @budget.add_department(@bidness)

      hash = {@customer_service => 200,
              @bidness => 600000
            }
      
      expect(@budget.current_expenses_by_department).to eq(hash)
    end
  end
end

