require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
require("@nomiclabs/hardhat-ethers");


/** @type import('hardhat/config').HardhatUserConfig */

module.exports = {
  solidity: "0.8.19",
  defaultNetwork: "Sepolia",
  networks: {
    hardhat: {},
    Sepolia: {
      url: process.env.INFURA_SEPOLIA_API,
      accounts: [process.env.PRIVATE_KEY],
    }
  }
};

