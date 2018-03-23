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
    uint totalSalary = 0;
    
    address owner;
    mapping(address => Employee) public employees;
    
    function Payroll() public {
        owner = msg.sender;
    }
    
    modifier employeeExist(address employeeId) {
        var employee = employees[employeeId];
        assert(employee.id != 0x0);
        _;
    }
    
    modifier employeeNotExist(address employeeId) {
        var employee = employees[employeeId];
        assert(employee.id == 0x0);
        _;
    }
    
    function _partialPaid(Employee employee) private {
        uint payment = employee.salary.mul(now.sub(employee.lastPayday)).div(payDuration);
        employee.id.transfer(payment);
    }
    
    function addEmployee(address employeeId, uint salary) onlyOwner public {
        
        var employee = employees[employeeId];
        assert(employee.id == 0x0);
        
        totalSalary = totalSalary.add(salary.mul(1 ether));
        
        employees[employeeId] = Employee(employeeId, salary.mul(1 ether), now);
    }
    
    function removeEmployee(address employeeId) onlyOwner employeeExist(employeeId) public {
        var employee = employees[employeeId];
        
        totalSalary = totalSalary.sub(employee.salary);
        
        _partialPaid(employee);
        delete employees[employeeId];
    }
    
    function updateEmployee(address employeeId, uint salary) onlyOwner employeeExist(employeeId) public {
        var employee = employees[employeeId];
        
        totalSalary = totalSalary.sub(employee.salary);
        totalSalary = totalSalary.add(salary.mul(1 ether));
        
        _partialPaid(employee);
        employees[employeeId].salary = salary.mul(1 ether);
        employees[employeeId].lastPayday = now;
    }
    
    function addFund() payable public returns (uint) {
        return this.balance;
    }
    
    function calculateRunway() public returns (uint) {
        // 防止无员工时调用产生除零异常
        assert(totalSalary != 0);
        return this.balance.div(totalSalary);
    }
    
    function hasEnoughFund() public returns (bool) {
        return calculateRunway() > 0;
    }
    
    function getPaid() employeeExist(msg.sender) public {
        var employee = employees[msg.sender];
        
        uint nextPayday = employee.lastPayday.add(payDuration);
        assert(nextPayday < now);
        
        employee.lastPayday = nextPayday;
        employee.id.transfer(employee.salary);
    }
    
    function changePaymentAddress(address employeeId, address refleshEmployeeId) onlyOwner employeeExist(employeeId) employeeNotExist(refleshEmployeeId) {
        var employee = employees[employeeId];
        
        employees[refleshEmployeeId] = Employee(refleshEmployeeId, employee.salary, employee.lastPayday);
        delete employees[employeeId];
    }
}
