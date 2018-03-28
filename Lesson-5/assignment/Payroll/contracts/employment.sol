//solidity version
pragma solidity ^0.4.14;

import "./safemath.sol";
import "./Ownable.sol";

//contract declaration
contract Payroll is Ownable {
    using SafeMath for uint;
        //Define variables;
    struct Employee{
        address id;
        uint salary;
        uint lastPayday;
    }
    
    mapping(address => Employee) public employees;
    address administrator;
    uint constant payDuration = 10 seconds;
    uint totalSalary = 0;
    uint totalEmployee = 0;
    
    modifier existEmployee(address employeeId) {
        var employee = employees[employeeId];
        assert(employeeId != 0x0);
        _;
    }
    
    //add employee
    function addEmployee(address employeeId, uint salary) onlyOwner {
        var employee = employees[employeeId];
        assert(employee.id == 0x0);
        employees[employeeId] = Employee(employeeId, salary.mul(1 ether), now);
        totalSalary = totalSalary.add(salary.mul(1 ether));
        totalEmployee = totalEmployee.add(1);
    }
    
    //remove employee
    function removeEmployee(address employeeId) onlyOwner existEmployee(employeeId) {
        var employee = employees[employeeId];
        _wages(employee);
        totalSalary = totalSalary.sub(employees[employeeId].salary.mul(1 ether));
        delete employees[employeeId];
        totalEmployee = totalEmployee.sub(1);
        return;
    }
    
    //Pay the wages when address or salary changes
    function _wages(Employee employee) private {
        uint wage = employee.salary.mul(now.sub(employee.lastPayday)).div(payDuration);
        employee.id.transfer(wage);
        employee.lastPayday = now;
    }
    
    //Adjust or declare the salary of your employee
    function adjustSalary(address employeeId, uint newSalary) onlyOwner existEmployee(employeeId) {
        var employee = employees[employeeId];
        _wages(employee);
        totalSalary = totalSalary.add(employee.salary.sub(newSalary));
        employees[employeeId].salary = newSalary.mul(1 ether);
        employees[employeeId].lastPayday = now;
    }
    
    //Add etherium fund into the contract
    function addFund() payable returns (uint) {
        return this.balance;
    }
    
    //change payment address
    function changePaymentAddress(address employeeId, address newAddress) onlyOwner existEmployee(employeeId) {
        var employee = employees[employeeId];
        uint currentSalary = employee.salary.div(1 ether);
        uint wage = employee.salary.mul(now.sub(employee.lastPayday).div(payDuration));
        totalSalary = totalSalary.sub(employees[employeeId].salary.mul(1 ether));
        delete employees[employeeId];
        addEmployee(newAddress, currentSalary);
        var newEmployee = employees[newAddress];
        newEmployee.id.transfer(wage);
        newEmployee.lastPayday = now;
    }
    
    //check employees details
    function checkEmployee(address employeeId) returns (uint salary, uint lastPayday) {
        var employee = employees[employeeId];
        salary = employee.salary;
        lastPayday = employee.lastPayday;
    }
    
    //calculate how many times can be paid from your balance
    function calculateRunway() returns (uint) {
        return this.balance.div(totalSalary);
    }
    
    //calculate if your balance can afford the next payment
    function enoughFund() returns (bool) {
        return calculateRunway() > 0;
    }
    
    //your employee can get paid from this function
    function getPaid() existEmployee(msg.sender) {
        var employee = employees[msg.sender];
        
        uint nextPayday = employee.lastPayday.add(payDuration);
        
        assert(nextPayday < now);
        
        employees[msg.sender].lastPayday = nextPayday;
        employee.id.transfer(employee.salary);
    }

    function checkInfo() returns (uint balance, uint runway, uint employeeCount) {
        balance = this.balance;
        employeeCount = totalEmployee;

        if (totalSalary > 0) {
            runway = calculateRunway();
        }
    }
}