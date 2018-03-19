/*作业请提交在这个目录下*/
<<<<<<< HEAD
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

    function Payroll() public{
        owner = msg.sender;
    }
    
    function _partialPaid(Employee employee) private {
        uint payment = employee.salary * (now - employee.lastPayday) / payDuration;
        employee.id.transfer(payment);
    }
    
    function _findEmployee(address employeeId) view private returns (uint) {
        for(uint i =0;i<employees.length;i++){
            if(employees[i].id == employeeId)
                return i ;
        }
        return employees.length;
    }

    function addEmployee(address employeeId, uint salary) public{
        require(msg.sender == owner);
        uint index = _findEmployee(employeeId);
        if(index < employees.length){
            revert();
        }
        employees.push(Employee(employeeId,salary,now));
    }
    
    function removeEmployee(address employeeId) public {
        require(msg.sender == owner);
        uint index = _findEmployee(employeeId);
        require(index<employees.length);
            
        employees[index] = employees[employees.length-1];
        employees.length -=1;
    }
    
    function updateEmployee(address employeeId, uint salary) public {
        require(msg.sender == owner);
        require(employeeId != 0x0);
        uint index = _findEmployee(employeeId);
        require(index<employees.length);
        
        _partialPaid(employees[index]);
        employees[index].salary = salary * 1 ether;
    }
    
    function addFund() payable public returns (uint){
        return address(this).balance;
    }
    
    function calculateRunway() view public returns (uint){
        uint totalSalary = 0;
        for (uint i = 0; i < employees.length; i++) {
            totalSalary += employees[i].salary;
        }
        return address(this).balance / totalSalary;
    }
    
    function hasEnoughFund() public returns (bool){
        return calculateRunway() > 0;
    }
    
    function getPaid() public{
        uint index = _findEmployee(msg.sender);
        require(index<employees.length); 

        uint nextPayday = employees[index].lastPayday + payDuration;
        assert(nextPayday < now);
        employees[index].lastPayday = nextPayday;
        employees[index].id.transfer(employees[index].salary);
        
    }
}

=======
>>>>>>> upstream/master
