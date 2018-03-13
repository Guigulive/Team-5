pragma solidity ^0.4.14;

contract Payroll {
    uint constant payDuration = 10 seconds;
    
    address owner;
    address employee;
    uint salary;
    uint lastPayday;
    
    function Payroll() public {
        owner = msg.sender;
    }
    
    function updateEmployee(address e, uint s) public {
        require(msg.sender == owner);
        
        if (employee != 0x0) {
            uint payment = salary * (now - lastPayday) / payDuration;
            employee.transfer(payment);
        }
        
        employee = e;
        salary = s * 1 ether;
        lastPayday = now;
    }
    
    function addFund() payable public returns (uint) {
        return this.balance;
    }
    
    function calculateRunway() public returns (uint) {
        return this.balance / salary;
    }
    
    function hasEnoughFund() public returns (bool) {
        return calculateRunway() > 0;
    }
    
    function getPaid() {
        require(msg.sender == employee);
        
        uint nextPayday = lastPayday + payDuration;
        assert(nextPayday < now);
        
        lastPayday = nextPayday;
        employee.transfer(salary);
    }

    //CHANGE CURRENT EMPLOYEE ADDRESS, IF SUCCEED THEN RETURN EX-EMPLOYEE
    function changeEmployee(address e) public returns (address) {
        require(msg.sender == owner);
        
        if (employee != 0x0) {
            uint payment = salary * (now - lastPayday) / payDuration;
            employee.transfer(payment);
        }
        lastPayday = now;
        
        address exEmployee = employee;
        employee = e;
        return exEmployee;
    }
    
    //CHANGE CURRENT EMPLOYEE SALARY, IF SUCCEED THEN RETURN OLD SALARY
    function changeSalary(uint s) public returns (uint) {
        require(msg.sender == owner);
        
        if (employee != 0x0) {
            uint payment = salary * (now - lastPayday) / payDuration;
            employee.transfer(payment);
        }
        lastPayday = now;
        
        uint oldSalary = salary / 1 ether;
        salary = s * 1 ether;
        return oldSalary;
    }
}
