/*作业请提交在这个目录下*/
pragma solidity ^0.4.14;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address public owner;


  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() public {
    owner = msg.sender;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));
    emit OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }
}

contract Payroll is Ownable{

    using SafeMath for uint256;

    struct Employee {
        address id;
        uint salary;
        uint lastPayday;
    }
    
    uint constant payDuration = 10 seconds;

    mapping (address => Employee) employees;
    
    uint totalSalary;


    modifier employeeExist(address employeeId) {
        require(employees[employeeId].salary >0);
        _;
    }
    
    function _partialPaid(address employeeId) private employeeExist(employeeId){
        uint payment = employees[employeeId].salary * (now - employees[employeeId].lastPayday) / payDuration;
        employees[employeeId].lastPayday = now;
        employees[employeeId].id.transfer(payment);
    }
    

    function addEmployee(address employeeId, uint salary) public onlyOwner {
        employees[employeeId] = Employee(employeeId,salary*1 ether,now);
        totalSalary+=salary*1 ether;
    }
    
    function removeEmployee(address employeeId) public onlyOwner {            
        totalSalary-=employees[employeeId].salary;
        delete employees[employeeId];
    }
    
    function updateEmployee(address employeeId, uint salary) public onlyOwner employeeExist(employeeId){
        require(salary > 0);       
        _partialPaid(employeeId);
        totalSalary-=employees[employeeId].salary;
        employees[employeeId].salary = salary * 1 ether;
        totalSalary+=salary*1 ether;
    }
    
    function addFund() payable public returns (uint) {
        return address(this).balance;
    }
    
    function calculateRunway() view public returns (uint) {
        return address(this).balance / totalSalary;
    }
    
    function hasEnoughFund() view public returns (bool) {
        return calculateRunway() > 0;
    }
    
    function getPaid() public employeeExist(msg.sender){
        uint nextPayday = employees[msg.sender].lastPayday + payDuration;
        assert(nextPayday < now);
        employees[msg.sender].lastPayday = nextPayday;
        employees[msg.sender].id.transfer(employees[msg.sender].salary);      
    }

    function changePaymentAddress(address newAddr) public employeeExist(msg.sender){
        Employee memory employee = employees[msg.sender];
        delete employees[employee.id];
        employee.id = newAddr;
        employees[employee.id] = employee;
    }
}
