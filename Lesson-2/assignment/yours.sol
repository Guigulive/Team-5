pragma solidity ^0.4.14;

contract Payroll {
    struct Employee {
        address id;
        uint salary;
        uint lastPayday;
    }

    uint constant payDuration = 10 seconds;

    address owner;
    Employee[] employees;

    //总工资
    uint totalSalary;

    function Payroll() public {
        owner = msg.sender;
    }

    function _partialPaid(Employee employee) private {
        uint payment = employee.salary * (now - employee.lastPayday) / payDuration;
        employee.id.transfer(payment);
    }

    function _findEmployee(address employeeId) view private returns (Employee, uint) {
        for (uint i = 0; i < employees.length; i++) {
            if (employees[i].id == employeeId) {
                return (employees[i], i);
            }
        }
    }

    function addEmployee(address employeeId, uint salary) public {
        require(msg.sender == owner);
        var(employee, index) = _findEmployee(employeeId);
        assert(employee.id == 0x0);
        employees.push(Employee(employeeId, salary * 1 ether, now));
        //每增加一名员工，就加入总工资
        totalSalary += salary * 1 ether;
    }

    function removeEmployee(address employeeId) public {
        require(msg.sender == owner);
        var (employee, index) = _findEmployee(employeeId);
        assert(employee.id != 0x0);
        _partialPaid(employee);
        employees[index] = employees[employees.length - 1];
        employees.length -= 1;
        //每删除一名员工，就从总工资中减去
        totalSalary -= employee.salary;
    }

    function updateEmployee(address employeeId, uint salary) public {
        require(msg.sender == owner);
        var (employee, index) = _findEmployee(employeeId);
        assert(employee.id != 0x0);
        _partialPaid(employee);
        //把这名员工旧的工资数从总工资中减去
        totalSalary -= employee.salary;
        employees[index].salary = salary * 1 ether;
        employees[index].lastPayday = now;
        //再把这名员工新的工资数加到总工资中
        totalSalary += salary * 1 ether;
    }

    function addFund() payable public returns (uint) {
        return address(this).balance;
    }

    function calculateRunway() view public returns (uint) {
        return address(this).balance / totalSalary;
    }

    function hasEnoughFund() public returns (bool) {
        return calculateRunway() > 0;
    }

    function getPaid() public {
        var (employee, index) = _findEmployee(msg.sender);
        assert(employee.id != 0x0);

        uint nextPayday = employee.lastPayday + payDuration;
        assert(nextPayday < now);

        employees[index].lastPayday = nextPayday;
        employee.id.transfer(employee.salary);
    }
}
