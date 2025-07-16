// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract ReputationVerifier {
    mapping(bytes32 => bool) private proofs;
    mapping(address => mapping(string => bool)) private passedTests;

    event ProofSubmitted(address indexed user, bytes32 proofHash, string skill);
    event ProofVerified(address indexed user, bytes32 proofHash, bool valid);

    // Imitate submitting a ZK-proof by storing a hash and marking the skill as passed
    function submitProof(bytes32 proofHash, string memory skill) public {
        proofs[proofHash] = true;
        passedTests[msg.sender][skill] = true;
        emit ProofSubmitted(msg.sender, proofHash, skill);
    }

    // Imitate verifying a ZK-proof by checking if the hash exists
    function verifyProof(bytes32 proofHash) public returns (bool) {
        bool valid = proofs[proofHash];
        emit ProofVerified(msg.sender, proofHash, valid);
        return valid;
    }

    // Check if a user has passed a skill
    function hasPassed(address user, string memory skill) public view returns (bool) {
        return passedTests[user][skill];
    }
} 