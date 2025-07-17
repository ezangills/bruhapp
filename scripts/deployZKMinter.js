// this script is just for testing purposes

const { ethers } = require("hardhat");

async function main() {
    const soulboundTokenAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
    const skillVerifierAddress = "0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0";

    if (!soulboundTokenAddress || !skillVerifierAddress) {
        throw new Error("Please provide --soulbound and --verifier addresses");
    }

    const ZKSoulboundMinter = await ethers.getContractFactory("ZKSoulboundMinter");
    const minter = await ZKSoulboundMinter.deploy(soulboundTokenAddress, skillVerifierAddress);
    await minter.waitForDeployment();
    console.log("ZKSoulboundMinter deployed to:", await minter.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
}); 