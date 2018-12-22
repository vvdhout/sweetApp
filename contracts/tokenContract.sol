pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Mintable.sol';

contract tokenContract is ERC721Full, ERC721Mintable {

    address owner private;

    constructor() public {
        owner == msg.sender;
    }

    // Smart contract code...

}