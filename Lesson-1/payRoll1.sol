pragma solidity ^0.4.14;

contract Payroll {
   uint salary = 1 ether;
   address frank = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c ;
   uint constant payDuration = 30 seconds;
   uint lastPayday = now;
   
   //更改员工薪水
   function changeSalary(uint currentSalary)returns(uint){
      require(msg.sender == owner);
       salary = currentSalary * 1 ether;
       return salary;
   }
   
   //更改员工地址
   function changeAddress(address e) returns (address){
       require(msg.sender == owner);
       frank = e;
       return frank;
   }
   
   //往智能合约里加钱
   function addFund() payable returns (uint) {
        return this.balance;
   }
   
   // 返回钱能支付工资的次数
   function calculateRunway() returns (uint){
       return this.balance / salary;
   }
   
   //查看在contract中工资的钱能否支持一个月的钱
   function hasEnoughFund() returns(bool){
       return calculateRunway() > 0;
   }
   
   //取钱
   function getPaid(){
       uint nextPayDay = lastPayday + payDuration;
       if( nextPayDay > now){
          revert();
       }
    
       lastPayday = nextPayDay ;
       frank.transfer(salary);
       
       
   }
   
}
