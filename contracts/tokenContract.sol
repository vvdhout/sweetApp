pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';

contract tokenContract is ERC721 {

    address owner;

    constructor() public {
        owner = msg.sender;
    }

    function getContractOwner() public view returns (address) {
        return owner;
    }

}