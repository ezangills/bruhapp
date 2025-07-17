pragma circom 2.0.0;

include "poseidon.circom";

template SkillProof() {
    signal input skillSecret; // private input
    signal input skillHash; // public input

    component hasher = Poseidon(1);
    hasher.inputs[0] <== skillSecret;

    skillHash === hasher.out;
}

component main {public [skillHash]} = SkillProof();