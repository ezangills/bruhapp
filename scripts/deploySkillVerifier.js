const { ethers } = require("hardhat");

async function main() {
    const SkillVerifier = await ethers.getContractFactory("Groth16Verifier");
    const skillVerifier = await SkillVerifier.deploy();
    await skillVerifier.waitForDeployment();
    console.log("SkillVerifier deployed to:", await skillVerifier.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});