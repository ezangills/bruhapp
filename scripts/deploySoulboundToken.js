// this script is just for testing purposes

const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    const SoulboundToken = await ethers.getContractFactory("SoulboundToken");
    const soulboundToken = await SoulboundToken.deploy();
    await soulboundToken.waitForDeployment();
    console.log("SoulboundToken deployed to:", await soulboundToken.getAddress());

    // Mint a soulbound token to the deployer as an example
    const mintTx = await soulboundToken.mint(deployer.address, "Solidity Developer"); // TODO: make proper passing of the second argument which is the skill name
    await mintTx.wait();
    console.log("Minted a soulbound token to:", deployer.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
