var PayRoll = artifacts.require("Payroll");

contract('PayRoll', function(accounts) {

    var payroll; 
    var employeeId = 1; 
    var testSalary = 1; 

    it("add employee", function() {    
        return PayRoll.deployed()
        .then(function(instance) {
            payroll = instance;
            return payroll.addEmployee(accounts[employeeId], testSalary, {from: accounts[0]});
        }).then(function() {
            return payroll.employees.call(accounts[employeeId]);
        }).then(function(employee) {
            var salary = employee[1].toNumber();
            var timeStamp = employee[2].toNumber();
            salary = web3.fromWei(salary, 'ether');
            assert.equal(salary, testSalary, "salary is not 1.");
            assert.equal(timeStamp, web3.eth.getBlock(web3.eth.blockNumber).timestamp, "lastPayDay is not set to be the current block time!");
        });
    });

    it("add Fund", function() {
        return payroll.addFund({from:accounts[0], value: web3.toWei(2, 'ether')})
        .catch(function (err){
            assert.fail("add some fund!");
        });
    });

    it("remove employee", function() {

        return payroll.removeEmployee(accounts[employeeId], {from: accounts[0]})
        .then(function() {
            return payroll.employees.call(accounts[employeeId]);
        }).then(function(employee) {
            var salary = employee[1].toNumber();
            var timeStamp = employee[2].toNumber();
            salary = web3.fromWei(salary, 'ether');
            assert.equal(salary, 0, "salary is not null.");
            assert.equal(timeStamp, 0, "lastPayDay is not null");
        });
    });

    //getPaid
    it("cannot get paid", function () {
        var hasThrown = true;
        var payDuration = 10;
        web3.currentProvider.send({jsonrpc: "2.0", method: "evm_increaseTime", params: [payDuration-24*60*60], id: 0})
        web3.currentProvider.send({jsonrpc: "2.0", method: "evm_mine", params: [], id: 0});

        return payroll.getPaid({from: accounts[employeeId]
        }).then(function() {
            hasThrown = false;
            assert.fail('should thrown');
        })
        .catch(function(err) {
            assert.equal(hasThrown, true, "cannot get paid");
        }); 
    });

    it("can get paid", function () {
        var hasThrown = true;
        var payDuration = 2;
        web3.currentProvider.send({jsonrpc: "2.0", method: "evm_increaseTime", params: [payDuration-24*60*60], id: 0})
        web3.currentProvider.send({jsonrpc: "2.0", method: "evm_mine", params: [], id: 0});

        return payroll.getPaid({from: accounts[employeeId]
        }).then(function() {
            hasThrown = false;
            assert.fail('should thrown');
        })
        .catch(function(err) {
            assert.equal(hasThrown, true, "can get paid");
        }); 
    });

});
