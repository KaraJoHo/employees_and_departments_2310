class Budget 
  attr_reader :year, :departments 

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def departments_with_low_expenses
    @departments.find_all do |department| 
      department.expenses < 500
    end
  end

  def employee_salaries 
    # require 'pry'; binding.pry
    all_employees.map do |employee| 
      employee.salary
    end
  end

  def all_employees 
    @departments.map do |department|
      department.employees
    end.flatten
  end
end