pragma solidity ^0.5.0;

import './ERC721Token.sol';

contract tokenContract is ERC721Token {
    
    // Create owner variable
    address private owner;
    
    // Constructor for initializing the contract and setting the owner to msg.sender
    constructor() public {
        owner == msg.sender;
    }
    
    // Creating an onlyContractOwner variable
    modifier onlyContractOwner() {
        require(msg.sender == owner);
        _;
    }

    // Do more...

}