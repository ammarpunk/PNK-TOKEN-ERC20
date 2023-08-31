const hh = require("hardhat");

async function main() {
    const PunkToken = await hh.ethers.getContractFactory("Punk");
    const punkToken = await PunkToken.deploy(1000000,50);

    await punkToken.deployed();

    console.log("PunkToken is deployed ", punkToken.address);
}

main().catch((error) => {
    console.error(error);
    process.exitcode = 1;
});
