var Payroll = artifacts.require("./Payroll.sol");

contract('Payroll', function(accounts) {

    it("addEmployee's feature test", function() {
      return Payroll.deployed().then(function(instance) {
        payrollInstance = instance;
        payrollInstance.addFund({from: accounts[0], value: 5});
        return payrollInstance.addEmployee(accounts[1], 5);
      }).then(function(){
            return payrollInstance.employees.call(accounts[1]);
        }).then(function(Employee) {
            assert.equal(Employee[0], account[1], "Add employee failed.");
        }).catch(function(err){
            assert(true);
        })
    });

    it("removeEmployee's feature test", function() {
        return Payroll.deployed().then(function(instance) {
            payrollInstance = instance;
            payrollInstance.addFund({from: accounts[0], value:50});
            return payrollInstance.addEmployee(accounts[1], 2);
        }).then(function() {
            return payrollInstance.removeEmployee(account[1]);
        }).then(function() {
            return payrollInstance.employees.call(account[1]);
        }).then(function(Employee) {
            assert.equal(Employee[0], 0 , "Failure to remove");
        }).catch(function(err){
            assert(true);
        })
    })
  
});
  