// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

interface ISoulboundToken {
    function mint(address to, string memory skillName) external;
}

interface ISkillVerifier {
    function verifyProof(
        uint[2] calldata a,
        uint[2][2] calldata b,
        uint[2] calldata c,
        uint[1] calldata input
    ) external view returns (bool);
}

contract ZKSoulboundMinter {
    ISoulboundToken public soulboundToken;
    ISkillVerifier public skillVerifier;

    // Prevent double-minting for the same skillHash
    mapping(address => mapping(uint256 => bool)) public hasMinted;

    constructor(address _soulboundToken, address _skillVerifier) {
        soulboundToken = ISoulboundToken(_soulboundToken);
        skillVerifier = ISkillVerifier(_skillVerifier);
    }

    function mintWithProof(
        address to,
        string memory skillName,
        uint[2] calldata a,
        uint[2][2] calldata b,
        uint[2] calldata c,
        uint[1] calldata input // skillHash
    ) external {
        require(!hasMinted[to][input[0]], "Already minted for this skill");
        require(skillVerifier.verifyProof(a, b, c, input), "Invalid ZK proof");
        hasMinted[to][input[0]] = true;
        soulboundToken.mint(to, skillName);
    }
} 