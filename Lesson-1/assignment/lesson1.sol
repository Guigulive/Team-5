pragma solidity ^0.4.14;

contract Payroll {
    
    address owner;
    address currentEmployee;
    uint lastPayday;
    uint salary = 1 ether;
    uint constant payDuration = 10 seconds;

    function Payroll() {
        owner = msg.sender;
    }
    
    function updateEmployee(address _address, uint _salary) {
        currentEmployee = _address;
        salary = _salary * 1 ether;
        lastPayday = now;
    }
    
    function updateEmployeeAddress(address _address) {
        currentEmployee = _address;
        lastPayday = now;
    }
    
    function updateEmployeeSalary(uint _salary) {
        salary = _salary * 1 ether;
    }
    
    function addFund() payable returns (uint) {
        return this.balance;
    }
    
    function calculateRunway() returns (uint) {
        return this.balance / salary;
    }
    
    function hasEnoughFund() returns (bool) {
        return calculateRunway() > 0;
    }
    
    function getPaid() {
        uint nextPayday = lastPayday + payDuration;
        if (nextPayday > now) {
            revert();
        }
        lastPayday = nextPayday;
        currentEmployee.transfer(salary);
    }
}