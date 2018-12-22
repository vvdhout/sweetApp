const ERC721 = artifacts.require('ERC721');
const ERC721Token = artifacts.require('ERC721Token');
const tokenContract = artifacts.require('tokenContract');

module.exports = function(deployer) {
	deployer.deploy(tokenContract);
} 