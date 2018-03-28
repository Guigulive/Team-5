var Ownable = artifacts.require("./Ownable.sol");
var SafeMath = artifacts.require("./SafeMath.sol");
var employment = artifacts.require("./Payroll.sol");

module.exports = function(deployer) {
  deployer.deploy(Ownable);
  deployer.deploy(SafeMath);

  deployer.link(Ownable, employment);
  deployer.link(SafeMath, employment);
  deployer.deploy(employment);
};
