require "employee"

class Startup
    attr_reader :name,:funding,:salaries,:employees

    def initialize(name,funding,sal_hash)

        @name = name
        @funding = funding
        @salaries = sal_hash
        @employees = []
    end
    def valid_title?(title)

        @salaries.has_key?(title)
    end
    
    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)

        if valid_title?(title) == true
            new_guy = Employee.new(employee_name,title)
            @employees << new_guy
        else
            raise "unable to add " + employee_name 
        end
        
    end

    def size

        @employees.length
    end

    def pay_employee(employee_instance)

        if @funding >= @salaries[employee_instance.title]
            employee_instance.pay(@salaries[employee_instance.title])
            @funding -= @salaries[employee_instance.title]
        else
            raise "your startup is broke"
        end
    end

    def payday

        @employees.each {|employee| pay_employee(employee)}

    end


    def average_salary

        @employees.inject(0) {|sum,employee|  sum + @salaries[employee.title]} / size
    end

    def close
        @employees.clear
        @funding = 0    
    end

    def acquire(startup)

        @funding = @funding + startup.funding
        
        startup.employees.each {|person| @employees << person }
        @salaries.merge!(startup.salaries) {|key, oldval, newval| oldval}
        startup.close


    end
end
