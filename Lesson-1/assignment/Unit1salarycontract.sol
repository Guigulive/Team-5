pragma solidity ^0.4.14;

contract Payroll{
    uint salary;
    address administrator;
    address employee;
    uint constant payDuration = 10 seconds;
    uint lastPayday = now;
    
    function employer () {
        administrator = msg.sender;
    }
    
    function toEmployee(address switchEmployee) returns (address){
        require(msg.sender == administrator);
        employee = switchEmployee;
        return employee;
    }
    
    function adjustSalary(uint newSalary) returns (uint){
        require(msg.sender == administrator);
        salary = newSalary * 1 ether;
        return salary;
    }
    
    function addFund() payable returns (uint) {
        return this.balance;
    }
    
    function calculateRunway() returns (uint) {
        return this.balance / salary;
    }
    
    function enoughFund() returns (bool) {
        return calculateRunway() > 0;
    }
    
    function getPaid() {
        if (msg.sender != employee) {
            revert();
        }
        
        uint nextPayday = lastPayday + payDuration;
        if (nextPayday > now) {
            revert();
        }
        
            lastPayday = nextPayday;
            employee.transfer(salary);
        }
    }
