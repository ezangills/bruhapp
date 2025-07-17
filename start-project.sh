#!/bin/bash

echo "🚀 Starting BruhApp - ZK Skill Verification Platform"
echo "=================================================="

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ Node.js and npm are installed"

# Install backend dependencies
echo "📦 Installing backend dependencies..."
npm install

# Install frontend dependencies
echo "📦 Installing frontend dependencies..."
cd frontend
npm install
cd ..

echo ""
echo "🎯 Setup complete! Next steps:"
echo ""
echo "1. Start local blockchain:"
echo "   npx hardhat node"
echo ""
echo "2. Deploy smart contracts (in new terminal):"
echo "   npx hardhat run scripts/deploySoulboundToken.js --network localhost"
echo "   npx hardhat run scripts/deploySkillVerifier.js --network localhost"
echo "   npx hardhat run scripts/deployZKMinter.js --network localhost"
echo ""
echo "3. Update contract addresses in frontend/src/config/contracts.ts"
echo ""
echo "4. Start frontend (in new terminal):"
echo "   cd frontend && npm run dev"
echo ""
echo "5. Open http://localhost:3000 in your browser"
echo ""
echo "📚 For detailed instructions, see README.md"
echo ""
echo "🎉 Happy coding!" 