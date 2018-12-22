const tokenContract = artifacts.require('tokenContract');

module.exports = function(deployer) {
	deployer.deploy(tokenContract);
} 