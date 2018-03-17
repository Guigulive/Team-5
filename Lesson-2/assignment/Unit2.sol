Gas的变化是因为每一次calculationrunway都要进行一次for loop寻找每一个employee并计算salary总和，每新增多1位employee，消耗的gas也随之增多。
以下是课件实例记录：

Before optimization:
  transation_cost	   execution_cost
1	     22949	           1677
2	     23737	           2465
3	     24525	           3253
4	     25313	           4041
5	     26101	           4829
6	     26889	           5617
7	     27677	           6405
8	     28465	           7193
9	     29253	           7981
10	   30041	           8769

我通过把totalSalary转变为一个全局变量，随每一位employee的增删与salary修改变动，替代原来的for loop，避免增加运算负荷，从而极大减少gas消耗。
以下是优化后的gas消耗记录：

Optimized:
1	     22100	           828
2	     22100	           828
3	     22100	           828
4	     22100	           828
5	     22100	           828
6	     22100	           828
7	     22100	           828
8	     22100	           828
9	     22100	           828
10	   22100	           828

--------------------------------------
智能合约代码：
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
    
    Employee[] employees;
    address administrator;
    uint constant payDuration = 10 seconds;
    uint totalSalary = 0;
    
    //identification of the contract owner
    function Payroll() {
        administrator = msg.sender;
    }
    
    //add employee
    function addEmployee(address employeeId, uint salary) {
        require(msg.sender == administrator);
        var (employee, index) = _findEmployee(employeeId);
        assert(employee.id == 0x0);
        employees.push(Employee(employeeId, salary * 1 ether, now));
        totalSalary += salary * 1 ether;
    }
    
    //remove employee
    function removeEmployee(address employeeId) {
        require(msg.sender == administrator);
        var (employee, index) = _findEmployee(employeeId);
        assert(employeeId != 0x0);
        _wages(employee);
        totalSalary -= employee.salary * 1 ether;
        delete employees[index];
        employees[index] = employees[employees.length - 1];
        employees.length -= 1;
        return;
    }
    
    //Pay the wages when address or salary changes
    function _wages(Employee employee) private {
        uint wage = employee.salary * (now - employee.lastPayday) / payDuration;
        employee.id.transfer(wage);
        employee.lastPayday = now;
    }
            
    //find employee function
    function _findEmployee(address employeeId) private returns (Employee, uint) {
        for (uint i = 0; i < employees.length; i++) {
            if (employees[i].id == employeeId) {
                return (employees[i], i);
            }
        }
    }        
    
    //Adjust or declare the salary of your employee
    function adjustSalary(address employeeId, uint newSalary) {
        require(msg.sender == administrator);
        var (employee, index) = _findEmployee(employeeId);
        assert(employeeId != 0x0);
        
        _wages(employee);
        totalSalary += (employee.salary - newSalary);
        employees[index].salary = newSalary * 1 ether;
        employees[index].lastPayday = now;
    }
    
    //Add etherium fund into the contract
    function addFund() payable returns (uint) {
        return this.balance;
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
    function getPaid() {
        var (employee, index) = _findEmployee(msg.sender);
        assert(employee.id != 0x0);
        
        uint nextPayday = employee.lastPayday + payDuration;
        
        assert(nextPayday < now);
        
        employees[index].lastPayday = nextPayday;
        employees[index].id.transfer(employee.salary);
    }
}
