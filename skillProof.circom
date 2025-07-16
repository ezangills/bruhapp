pragma circom 2.0.0;

include "poseidon.circom";

template SkillProof() {
    // The secret the user knows (private input)
    signal input skillSecret;
    // The hash of the secret (public input)
    signal input skillHash;

    // Instantiate Poseidon hasher for 1 input
    component hasher = Poseidon(1);
    hasher.inputs[0] <== skillSecret;

    // Enforce that the computed hash matches the public hash
    skillHash === hasher.out;
}

component main = SkillProof();