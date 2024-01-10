class Employee 
  attr_reader :name, :age, :salary
  def initialize(employee_info)
    @name = employee_info[:name] 
    @age = employee_info[:age].to_i
    @salary = employee_info[:salary].delete!("$").to_i
  end

  def give_raise(amount)
    @salary = @salary + amount
  end

end