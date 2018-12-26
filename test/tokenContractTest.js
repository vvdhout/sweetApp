const tokenContract = artifacts.require("tokenContract");

contract("sweetApp test", async accounts => {

  it("should allow us to create a fruit", async () => {
    // Get deployed contract
    let instance = await tokenContract.deployed();
    // Perform a function of the contract
    await instance.createFruit("Banana", "Bork-fork the Banana Champ", {from: accounts[0]});
    // Store the result of another function of the contract
    let result = await instance.getFruit(1);
    // Assert if result is equal to something, and if not send a message
    assert.equal(result[0], "Bork-fork the Banana Champ", "name of the fruit was not equal to 'Bork-fork the Banana Champ'");
    assert.equal(result[1], "Banana", "type of fruit was not equal to 'Banana'");
  })

  it("should allow us to get a fruit using tokenId", async() => {
    // Get deployed contract
    let instance = await tokenContract.deployed();
    // Store the result of another function of the contract
    let result = await instance.getFruit(1);
    // Assert if result is equal to something, and if not send a message
    assert.equal(result[0], "Bork-fork the Banana Champ", "name of the fruit was not equal to 'Bork-fork the Banana Champ'");
    assert.equal(result[1], "Banana", "type of fruit was not equal to 'Banana'");
  })

});