require './lib/employee'
require 'rspec'

RSpec.describe Employee do 
  before(:each) do 
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})
  end

  describe "initialize" do 
    it "exists with attributes" do 
      expect(@bobbi).to be_a(Employee)
      expect(@bobbi.name).to eq("Bobbi Jaeger")
      expect(@bobbi.age).to eq(30)
      expect(@bobbi.salary).to eq(100000)
    end
  end

  describe "give_raise" do 
    it "can give the employee a raise" do 
     @bobbi.give_raise(5000)

     expect(@bobbi.salary).to eq(105000)
    end
  end
end