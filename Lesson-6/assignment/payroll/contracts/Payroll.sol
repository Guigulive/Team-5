pragma solidity ^0.4.14;

import "./SafeMath.sol";
import "./Ownable.sol";

contract Payroll is Ownable {
    using SafeMath for uint;
    struct Employee {
        address id;
        uint salary;
        uint lastPayday;
    }
    
    uint constant payDuration = 10 seconds;

    uint totalSalary;
    uint totalEmployee;
    
    // 由于mapping不能遍历，故要存储所有的address以便用于迭代（不优雅）
    address[] public employeeList;
    mapping(address => Employee) public employees;

    // DEFINE EVENTS
    event NewEmployee(
        address employee
    );
    event UpdateEmployee(
        address employee
    );
    event RemoveEmployee(
        address employee
    );
    event NewFund(
        uint balance
    );
    event GetPaid(
        address employee
    );


    modifier employeeExit(address employeeId) {
        var employee = employees[employeeId];
        assert(employee.id != 0x0);
        _;
    }
    
    function _partialPaid(Employee employee) private {
        uint payment = employee.salary
            .mul(now.sub(employee.lastPayday))
            .div(payDuration);
        employee.id.transfer(payment);
    }

    function checkEmployee(uint index) public returns (address employeeId, uint salary, uint lastPayday) {
        employeeId = employeeList[index];
        var employee = employees[employeeId];
        salary = employee.salary;
        lastPayday = employee.lastPayday;
    }
    
    function addEmployee(address employeeId, uint salary) onlyOwner public {
        var employee = employees[employeeId];
        assert(employee.id == 0x0);

        employees[employeeId] = Employee(employeeId, salary.mul(1 ether), now);
        totalSalary = totalSalary.add(employees[employeeId].salary);
        totalEmployee = totalEmployee.add(1);
        employeeList.push(employeeId);

        NewEmployee(employeeId);
    }
    
    function removeEmployee(address employeeId) onlyOwner public employeeExit(employeeId) {
        var employee = employees[employeeId];

        _partialPaid(employee);
        totalSalary = totalSalary.sub(employee.salary);
        delete employees[employeeId];
        totalEmployee = totalEmployee.sub(1);

        //TODO: 遍历 employeeList，以便删除相应员工地址
        for(uint idx = 0; idx < employeeList.length; idx++) {
            if(employeeList[idx] == employeeId) {
                employeeList[idx] = employeeList[employeeList.length - 1];
                break;
            }
        }
        delete employeeList[employeeList.length - 1];
        employeeList.length = employeeList.length - 1; 

        RemoveEmployee(employeeId);
    }
    
    function updateEmployee(address employeeId, uint salary) onlyOwner public employeeExit(employeeId) {
        var employee = employees[employeeId];

        _partialPaid(employee);
        totalSalary = totalSalary.sub(employee.salary);
        employee.salary = salary.mul(1 ether);
        employee.lastPayday = now;
        totalSalary = totalSalary.add(employee.salary);

        UpdateEmployee(employeeId);
    }
    
    function addFund() payable public returns (uint) {
        NewFund(this.balance);

        return this.balance;
    }
    
    function calculateRunway() public returns (uint) {
        return this.balance.div(totalSalary);
    }
    
    function hasEnoughFund() public returns (bool) {
        return calculateRunway() > 0;
    }
    
    function getPaid() public employeeExit(msg.sender) {
        var employee = employees[msg.sender];

        uint nextPayday = employee.lastPayday.add(payDuration);
        assert(nextPayday < now);

        employee.lastPayday = nextPayday;
        employee.id.transfer(employee.salary);

        GetPaid(msg.sender);
    }

    function checkInfo() public returns (uint balance, uint runway, uint employeeCount) {
        balance = this.balance;
        employeeCount = totalEmployee;

        if (totalSalary > 0) {
            runway = calculateRunway();
        }
    }
}
