const circomlibjs = require('circomlibjs');

async function main() {
    // Replace this with your secret
    const skillSecret = 12345;

    // Poseidon is now async and must be instantiated
    const poseidon = await circomlibjs.buildPoseidon();

    // Hash the secret
    const hash = poseidon.F.toString(poseidon([BigInt(skillSecret)]));

    console.log(hash);
}

main();