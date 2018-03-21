pragma solidity ^0.4.14;

contract Payroll {
    struct Employee {
        address id;
        uint salary;
        uint lastPayday;
    }

    uint constant payDuration = 10 seconds;
    uint totalSalary;
    address owner;
    mapping(address => Employee) public employees;

    function Payroll() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
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
        uint payment = employee.salary * (now - employee.lastPayday) / payDuration;
        employee.id.transfer(payment);
    }


    function addEmployee(address employeeId, uint salary) onlyOwner public  {
        var employee = employees[employeeId];
        assert(employee.id == 0x0);
        totalSalary += salary * 1 ether;
        employees[employeeId] = Employee(employeeId, salary * 1 ether, now);
    }

    function removeEmployee(address employeeId) onlyOwner employeeExist(employeeId) public {
        var employee = employees[employeeId];
        _partialPaid(employee);
        totalSalary -= employees[employeeId].salary;
        delete employees[employeeId];
    }

    function updateEmployee(address employeeId, uint salary) onlyOwner employeeExist(employeeId) public {
        var employee = employees[employeeId];

        _partialPaid(employee);
        totalSalary -= employees[employeeId].salary;
        employees[employeeId].salary = salary * 1 ether;
        totalSalary += employees[employeeId].salary;
        employees[employeeId].lastPayday = now;
    }

    function changePaymentAddress (address employeeId, address newEmployeeId) onlyOwner employeeExist(employeeId) employeeNotExist(newEmployeeId) public {
        var employee = employees[employeeId];
        _partialPaid(employee);
        employees[newEmployeeId] = Employee(newEmployeeId, employee.salary, now);
        delete employees[employeeId];
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

    function getPaid() employeeExist(msg.sender) public {
        var employee = employees[msg.sender];

        uint nextPayday = employee.lastPayday + payDuration;
        assert(nextPayday < now);

        employees[msg.sender].lastPayday = nextPayday;
        employee.id.transfer(employee.salary);
    }
}



- contract O
- contract A is O
- contract B is O
- contract C is O
- contract K1 is A, B
- contract K2 is A, C
- contract Z is K1, K2

L[O] = [O]
L[A] = [A] + merge(L[O],[O]) = [A,O]
L[B] = [B] + merge(L[O],[O]) = [B,O]
L[C] = [C] + merge(L[O],[O]) = [C,O]
L[K1] = [K1] + merge(L[A],L[B],[A,B])
      = [K1] + merge([A,O],[B,O],[A,B])
      = [K1,A] + merge([O],[B,O],[B])
      = [K1,A,B] + merge([O],[O])
      = [K1,A,B,O]
L[K2] = [K2,A,C,O]
L[Z] = [Z] + merge(L(K1),L(K2),[K1,K2])
     = [Z] + merge([K1,A,B,O],[K2,A,C,O],[K1,K2])
     = [Z,K1] + merge([A,B,O],[K2,A,C,O],[K2])
     = [Z,K1,K2] + merge([A,B,O],[A,C,O])
     = [Z,K1,K2,A] + merge([B,O],[C,O])
     = [Z,K1,K2,A,B] + merge([O],[C,O])
     = [Z,K1,K2,A,B,C] + merge([O],[O])
     = [Z,K1,K2,A,B,C,O]
