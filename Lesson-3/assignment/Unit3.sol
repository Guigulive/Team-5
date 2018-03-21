//solidity version
pragma solidity ^0.4.14;

//contract declaration
contract Payroll{
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
    
    //identification of the contract owner
    function Payroll() {
        administrator = msg.sender;
    }
    
    //modifier
    modifier admin {
       require(msg.sender == administrator);
       _;
    }
    
    modifier existEmployee(address employeeId) {
        var employee = employees[employeeId];
        assert(employeeId != 0x0);
        _;
    }
    
    //add employee
    function addEmployee(address employeeId, uint salary) admin {
        var employee = employees[employeeId];
        assert(employee.id == 0x0);
        employees[employeeId] = Employee(employeeId, salary * 1 ether, now);
        totalSalary += salary * 1 ether;
    }
    
    //remove employee
    function removeEmployee(address employeeId) admin existEmployee(employeeId) {
        var employee = employees[employeeId];
        _wages(employee);
        totalSalary -= employees[employeeId].salary * 1 ether;
        delete employees[employeeId];
        return;
    }
    
    //Pay the wages when address or salary changes
    function _wages(Employee employee) private {
        uint wage = employee.salary * (now - employee.lastPayday) / payDuration;
        employee.id.transfer(wage);
        employee.lastPayday = now;
    }
    
    //Adjust or declare the salary of your employee
    function adjustSalary(address employeeId, uint newSalary) admin existEmployee(employeeId) {
        var employee = employees[employeeId];
        _wages(employee);
        totalSalary += (employee.salary - newSalary);
        employees[employeeId].salary = newSalary * 1 ether;
        employees[employeeId].lastPayday = now;
    }
    
    //Add etherium fund into the contract
    function addFund() payable returns (uint) {
        return this.balance;
    }
    
    //change payment address
    function changePaymentAddress(address employeeId, address newAddress) admin existEmployee(employeeId) {
        var employee = employees[employeeId];
        uint currentSalary = employee.salary / 1 ether;
        addEmployee(newAddress, currentSalary);
        removeEmployee(employeeId);
    }
    
    //check employees details
    function checkEmployee(address employeeId) returns (uint salary, uint lastPayday) {
        var employee = employees[employeeId];
        salary = employee.salary;
        lastPayday = employee.lastPayday;
    }
    
    //calculate how many times can be paid from your balance
    function calculateRunway() returns (uint) {
        return this.balance / totalSalary;
    }
    
    //calculate if your balance can afford the next payment
    function enoughFund() returns (bool) {
        return calculateRunway() > 0;
    }
    
    //your employee can get paid from this function
    function getPaid() existEmployee(msg.sender) {
        var employee = employees[msg.sender];
        
        uint nextPayday = employee.lastPayday + payDuration;
        
        assert(nextPayday < now);
        
        employees[msg.sender].lastPayday = nextPayday;
        employee.id.transfer(employee.salary);
    }
}
