// This is the sweetApp contract. The only funcionality? Create a sweet-fruit token with a name and allow transfer between addresses.
// These are the fruits that can be chosen from: Banana, Orange, Strawberry, and a Potato just for the heck of it.

pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721.sol';

contract tokenContract is ERC721 {

    address private owner;
    
    // Fruit struct
    struct fruit {
        string typeOfFruit;
        string name;
    }
    
    // Track how many tokens exist and use as TokenId setter
    uint256 public tokenCount;
    
    // Map a tokenId to a fruit struct
    mapping (uint256 => fruit) fruits;
    
    // Map a fruithash to an existence boolean
    mapping (bytes32 => bool) fruitExists;
    
    // Map a tokenId to its selling price (default is 0 meaning it is not on sale)
    mapping (uint256 => uint256) fruitOnSale;
    

    constructor() public {
        owner = msg.sender;
        tokenCount = 0;
    }
    
    // Check if the fruit is one of the allowed types
    modifier isSweet(string _fruit) {
        require(keccak256(abi.encodePacked(_fruit)) == keccak256(abi.encodePacked("Banana")) || keccak256(abi.encodePacked(_fruit)) == keccak256(abi.encodePacked("Orange")) || keccak256(abi.encodePacked(_fruit)) == keccak256(abi.encodePacked("Strawberry")) || keccak256(abi.encodePacked(_fruit)) == keccak256(abi.encodePacked("Potato")), "Fruit type has to be a Banana, Orange, Strawberry, or Potato (we'll allow this diversion).");
        _;
    }

    // Check if the msg.sender is the owner of the fruit
    modifier isFruitOwner(uint256 _tokenId) {
        require(ownerOf(_tokenId) == msg.sender);
        _;
    }
    
    // Let the users create their own fruits
    function createFruit(string _typeOfFruit, string _name) public isSweet(_typeOfFruit) {
        // Require that the fruit and name combo does not already exist
        require(fruitExists[keccak256(abi.encodePacked(_typeOfFruit, _name))] == false, "Fruit and name combo already exists.");
        // Require that name length is less than 30 characters
        require(bytes(_name).length <= 30, "Name length has to be less than or equal to 30 characters.");
        // Set existence for our fruithash to true.
        fruitExists[keccak256(abi.encodePacked(_typeOfFruit, _name))] == true;
        // Increase token count by one
        tokenCount++;
        // Map tokenId to a fruit
        fruits[tokenCount].typeOfFruit = _typeOfFruit;
        fruits[tokenCount].name = _name;
        // Mint the token
        _mint(msg.sender, tokenCount);
    }

    // Get fruit info using tokenId
    function getFruit(uint256 _tokenId) public view returns (string _name, string _typeOfFruit) {
        return(fruits[_tokenId].name,fruits[_tokenId].typeOfFruit);
    }

    // Put fruit on sale (or take off sale by setting price to 0)
    function putOnSale(uint256 _tokenId, uint256 _price) public isFruitOwner(_tokenId) {
        fruitOnSale[_tokenId] = _price;
    }

    // Check if a fruit is on sale
    function isOnSale(uint256 _tokenId) public view returns(bool, uint256) {
        bool onsale = false;
        if(fruitOnSale[_tokenId] > 0) {
            onsale = true;
        }
        return(onsale, fruitOnSale[_tokenId]);
    }

}