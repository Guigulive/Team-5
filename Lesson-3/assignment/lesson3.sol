pragma solidity ^0.4.14;

import './SafeMath.sol';
import './Ownable.sol';

contract Payroll is Ownable {
    
    using SafeMath for uint;
    
    struct Employee {
        address id;
        uint salary;
        uint lastPayday;
    }
    uint constant payDuration = 10 seconds;
    mapping(address => Employee) public employees;
    uint totalSalary = 0;
    
    modifier employeeExist(address employeeId) {
        var employee= employees[employeeId];
        assert(employee.id != 0x0);
        _;
    }
    
    function _partialPaid(Employee employee) private {
        uint payment = employee.salary.mul(now.sub(employee.lastPayday)).div(payDuration);
        employee.id.transfer(payment);
    }

    function addEmployee(address employeeId, uint salary) onlyOwner {
        var employee = employees[employeeId];
        assert(employee.id == 0x0);
        employees[employeeId] = Employee(employeeId, salary * 1 ether, now);
        totalSalary = totalSalary.add(employees[employeeId].salary);
    }
    
    function removeEmployee(address employeeId) onlyOwner employeeExist(employeeId) {
        var employee = employees[employeeId];
        _partialPaid(employee);
        totalSalary = totalSalary.sub(employees[employeeId].salary) ;
        delete employees[employeeId];
    }
    
    function updateEmployee(address employeeId, uint salary) onlyOwner employeeExist(employeeId) {
        var employee= employees[employeeId];
         _partialPaid(employee);
        totalSalary = totalSalary.sub(employee.salary);
        employee.salary = salary * 1 ether;
        employee.lastPayday = now;
        totalSalary = totalSalary.add(salary * 1 ether);
    }
    
    function addFund() payable returns (uint) {
        return this.balance;
    }
    
    function calculateRunway() returns (uint) {
        return this.balance / totalSalary;
    }    
    
    function hasEnoughFund() returns (bool) {
        return calculateRunway() > 0;
    }
    
    function checkEmployee(address employeeId) public returns (uint salary, uint lastPayday) {
        var employee = employees[employeeId];
        salary = employee.salary;
        lastPayday = employee.lastPayday;
    }
    
    function getPaid() employeeExist(msg.sender){
        var employee = employees[msg.sender];
        uint nextPayday = employee.lastPayday + payDuration;
        assert (nextPayday < now);
        employee.lastPayday = nextPayday;
        employee.id.transfer(employee.salary);
    }
    
    modifier addressNotNil(address addressId) {
        require(addressId != address(0));
        _;
    }
    
    //更改员工薪水支付地址
    function changePaymentAddress(address employeeId, address newAddress) public onlyOwner addressNotNil(employeeId) addressNotNil(newAddress) {
        if(employeeId != newAddress) {
            var employee = employees[newAddress];
            var oldEmployee = employees[employeeId];
            employees[newAddress] = Employee(newAddress, oldEmployee.salary, oldEmployee.lastPayday);
            delete employees[employeeId];
        }

  }
}