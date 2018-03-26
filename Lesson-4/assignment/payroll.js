var Payroll = artifacts.require("./Payroll.sol");

contract('Payroll', function(accounts) {

    // define test variables
    owner_id = accounts[0];
    the_employee_id = accounts[1];
    the_employee_salary = 1;

  // function addEmployee(address employeeId, uint salary) onlyOwner public
  it("...should add an employee", function() {
    return Payroll.deployed().then(function(instance) {
      PayrollInstance = instance;

      // call target functions
      return PayrollInstance.addEmployee(the_employee_id, the_employee_salary, {from: owner_id});
    }).then(function() {
      // find the employee just added
      return PayrollInstance.employees.call(the_employee_id);
    }).then(function(theEmployee) {
      // assert the address and salary
      real_address = theEmployee[0];
      real_salary = theEmployee[1];
      assert.equal(real_address, the_employee_id, 'add employee failed with wrong address');
      assert.equal(real_salary, web3.toWei(the_employee_salary), "add employee failed with wrong salary.");
    });
  });

  // function addFund() payable public returns (uint)
  it("...should add fund, then calculate runway", function() {
    return Payroll.deployed().then(function(instance) {
      PayrollInstance = instance;

      // call target functions
      return PayrollInstance.addFund({from: owner_id, value: web3.toWei(2, 'ether')});
    }).then(function() {
      return PayrollInstance.calculateRunway.call();
    }).then(function(runway) {
      assert.equal(runway, 2, "wrong runway.");
    });
  });

  // function removeEmployee(address employeeId) onlyOwner employeeExist(employeeId) public
  it("...should remove the employee just added", function() {
    return Payroll.deployed().then(function(instance) {
      PayrollInstance = instance;
      
      // call target functions
      return PayrollInstance.removeEmployee(the_employee_id, {from: owner_id});
    }).then(function() {
      // find the employee just removed
      return PayrollInstance.employees.call(the_employee_id);
    }).then(function(theEmployee) {
      // assert the employee is null
      null_address = theEmployee[0];
      assert.equal(null_address, "0x0000000000000000000000000000000000000000", "remove employee failed.");
    });
  });

});
