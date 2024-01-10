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
    all_employees.map do |employee| 
      employee.salary
    end
  end

  def all_employees 
    @departments.map do |department|
      department.employees
    end.flatten
  end

  def current_expenses_by_department
    hash = {}

    @departments.each do |department|
      hash[department] = department.expenses
    end
  
    hash
  end
end