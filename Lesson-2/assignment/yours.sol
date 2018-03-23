/*
优化前Gas消耗记录：

 员工数量  transcation execution
    1       22966       1694
    2       23747       2475
    3       24528       3256
    4       25309       4037
    5       26090       4818
    6       26871       5599
    7       27652       6380
    8       28433       7161
    9       29214       7942
    10      29995       8723

分析原因：
由于Gas的消耗是与程序运行的指令（statement）数目正相关的，也就是和时间复杂度正相关，
分析calculateRunway()函数体，发现如下循环，时间复杂度O(n)，即执行时间与employees的长度正相关。
随着不断增加新员工，employees长度边长，执行指令数也线性增长，故Gas消耗呈现线性增长。

```
        for (uint i = 0; i < employees.length; i++){
            totalSalary += employees[i].salary;
        }
```

程序优化：
要减少Gas消耗，即降低calculateRunway()的时间复杂度，可将totalSalary存储为成员变量，
则可达到O(1)的时间复杂度，即Gas消耗为固定常量。

优化后Gas消耗记录：
 员工数量  transcation execution
    1       22356       1084
    2       22356       1084
    3       22356       1084
    4       22356       1084
    5       22356       1084
    6       22356       1084
    7       22356       1084
    8       22356       1084
    9       22356       1084
    10      22356       1084

测试结论符合预期。

*/

pragma solidity ^0.4.14;

contract Payroll {
    struct Employee {
        address id;
        uint salary;
        uint lastPayday;
    }
    uint constant payDuration = 10 seconds;
    uint totalSalary = 0;
    
    address owner;
    Employee[] employees;
    
    function Payroll() public {
        owner = msg.sender;
    }
    
    function _partialPaid(Employee employee) private {
        uint payment = employee.salary * (now - employee.lastPayday) / payDuration;
        employee.id.transfer(payment);
    }
    
    function _findEmployee(address employeeId) private returns (Employee, uint) {
        for (uint i = 0; i < employees.length; i++){
            if (employees[i].id == employeeId) {
                return (employees[i], i);
            }
        }
    }
    
    function addEmployee(address employeeId, uint salary) {
        require(msg.sender == owner);
        
        var (employee, index) = _findEmployee(employeeId);
        assert(employee.id == 0x0);
        
        totalSalary += salary * 1 ether;
        
        employees.push(Employee(employeeId, salary * 1 ether, now));
    }
    
    function removeEmployee(address employeeId) {
        require(msg.sender == owner);
        
        var (employee, index) = _findEmployee(employeeId);
        assert(employee.id != 0x0);
        
        totalSalary -= employee.salary;
        
        _partialPaid(employee);
        delete employees[index];
        employees[index] = employees[employees.length - 1];
        employees.length -= 1;
    }
    
    function updateEmployee(address employeeId, uint salary) public {
        require(msg.sender == owner);

        var (employee, index) = _findEmployee(employeeId);
        assert(employee.id != 0x0);
        
        totalSalary -= employee.salary;
        totalSalary += salary * 1 ether;
        
        _partialPaid(employee);
        employees[index].salary = salary * 1 ether;
        employees[index].lastPayday = now;
    }
    
    function addFund() payable public returns (uint) {
        return this.balance;
    }
    
    function calculateRunway() public returns (uint) {
        /*
        uint totalSalary = 0;
        for (uint i = 0; i < employees.length; i++){
            totalSalary += employees[i].salary;
        }
        */
        
        // 防止无员工时调用产生除零异常
        assert(totalSalary != 0);
        return this.balance / totalSalary;
    }
    
    function hasEnoughFund() public returns (bool) {
        return calculateRunway() > 0;
    }
    
    function getPaid() {
        var (employee, index) = _findEmployee(msg.sender);
        assert(employee.id != 0x0);
        
        uint nextPayday = employee.lastPayday + payDuration;
        assert(nextPayday < now);
        
        employee.lastPayday = nextPayday;
        employee.id.transfer(employee.salary);
    }
}
