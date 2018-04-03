1，	完成今天的智能合约添加100 Ethan到合约中，加入十个员工，每个员工的薪水都是1 Eth。

2，	每次加入一个员工后调用calculateRunway这个函数并且记录消耗的gas是多少？
消耗 2 gas.


3, Gas 变化吗？如果有，为什么？
有变化，因为调用了智能合约的函数 calculateRunway。
4， 如何优化 calculateRunway这个函数来减少gas的消耗？
在函数中避免使用 this关键字。

5，	提交：智能合约代码，gais的变化记录，calculateRunway函数的优化。
pragma solidity ^0.4.14;
contract Payroll {
   struct Employee{
       address id;
       uint salary;
       uint lastPayday;
       
   }
   
   uint constant payDuration = 5 seconds;
   address owner;    
   Employee[] employees;
   
    function Payroll(){
        //当前创建合约的人
       owner = msg.sender;
   }
   
   function _partialPaid(Employee employee) private{
        uint payment = employee.salary * (now - employee.lastPayday) / payDuration ;
        employee.id.transfer(payment); 
   }
   
   function _findEmployee(address employeeId ) private returns (Employee,uint ){
        for(uint i = 0; i < employees.length; i++ ){
            if( employees[i].id == employeeId ){
               return (employees[i], i );
            }    
       }       
   }
   
   function addEmployee(address employeeId, uint salary){
       require(msg.sender == owner);
       var (employee, index) = _findEmployee(employeeId);
       //保证你想要加入的这个员工是之前没有的,如果员工已经存在，就没有必要再加一遍了
       assert(employee.id == 0x0) ;
       
       employees.push(Employee( employeeId, salary * 1 ether, now ));
   }
   
   function removeEmployee(address employeeId){
        require(msg.sender == owner);
        var (employee, index) = _findEmployee(employeeId);
        assert(employee.id != 0x0) ;
        
        //否则快付工资的时候老板直接把你remove掉，你这个月不是白干了嘛,防止黑心老板,删除员工信息前，如果没有到payDuration规定的结算日，但也做了工作，就要先结算清楚
        _partialPaid( employee );
        delete employees[index];
        employees[index ]  = employees[ employees.length -1];
        employees.length -= 1 ;
   }
   
   function updateEmployee(address employeeId ,uint salary)    {
        require(msg.sender == owner);
        var (employee, index) = _findEmployee(employeeId);
        assert(employee.id != 0x0) ;
        
        _partialPaid( employee );
        employees[index].salary = salary * 1 ether;
        employees[index].lastPayday = now;
   }
   
   //往智能合约里加钱
   function addFund() payable returns (uint) {
        return this.balance;
   }
   
   // 返回钱能支付工资的次数
   function calculateRunway() returns (uint){
       uint totalSalary = 0 ;
       
       for(uint i = 0; i < employees.length; i++ ){
            totalSalary += employees[i].salary + totalSalary; 
       }       
       //当前可以支付多少次薪水
       return this.balance / totalSalary ;
   }
   
   //查看在contract中工资的钱能否支持一个月的钱
   function hasEnoughFund() returns(bool){
       return calculateRunway() > 0;
   }
   
   //到了领工资日，就可以点击领取工资
   function getPaid(){
       var (employee, index) = _findEmployee(msg.sender);
       assert(employee.id != 0x0) ;
        
       uint nextPayDay = employee.lastPayday + payDuration;
       assert(nextPayDay < now );
       
       employees[index].lastPayday = nextPayDay ;
       employees[index].id.transfer(employee.salary);              
   }
   
}
