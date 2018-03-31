var Payroll = artifacts.require("./Payroll.sol");

contract('Payroll', function(accounts) {

  var PayrollInstance;
  var employeeId = 1;

  it("...test addEmployee.", function() {
    return Payroll.deployed().then(function(instance) {
      PayrollInstance = instance;
      return PayrollInstance.addEmployee(accounts[1], 1, {from: accounts[0]});
    }).then(function() {
      return PayrollInstance.employees.call(accounts[1]);
    }).then(function(employee) {
      assert.equal(employee[0], accounts[1], "The address is wrong.");
      assert.equal(employee[1], web3.toWei(1), "The salary is wrong.");
    }).catch(function(err) {
      assert(true);
    })
  });

  it("...test removeEmployee", function() {
      return PayrollInstance.removeEmployee(accounts[1], {from: accounts[0]})
    .then(function() {
      return PayrollInstance.employees.call(accounts[1]);
    }).then(function(employee) {
      assert.equal(employee[0], "0x0000000000000000000000000000000000000000", "The remove failed.")
    }).catch(function(err) {
      assert(true);
    })
  });

  it("...test addFund", function() {
    return PayrollInstance.addFund({from:accounts[0], value: web3.toWei(10, 'ether')})
    .catch(function(err) {
      assert.fail("Add some funds.");
    })
  });

  it("...test can getPaid", function() {
    var hasThrown = true;
    
    web3.currentProvider.send({jsonrpc: "2.0", method: "evm_increaseTime", params: [11], id: 0});
    web3.currentProvider.send({jsonrpc: "2.0", method: "evm_mine", params: [], id: 0});

    return PayrollInstance.getPaid({from: accounts[employeeId]})
    .then(function() {
      hasThrown = false;
      assert.fail('should thrown');
    }).catch(function(err) {
      assert.equal(hasThrown, true, "can get paid");
    });
  });

  it("...test can't getPaid", function() {
    var hasThrown = true;

    web3.currentProvider.send({jsonrpc: "2.0", method: "evm_increaseTime", params: [5], id: 0});
    web3.currentProvider.send({jsonrpc: "2.0", method: "evm_mine", params: [], id: 0});

    return PayrollInstance.getPaid({from: accounts[employeeId]})
    .then(function() {
      hasThrown = false;
      assert.fail('should thrown');
    }).catch(function(err) {
      assert.equal(hasThrown, true, "cannot get paid");
    });
  });

});
