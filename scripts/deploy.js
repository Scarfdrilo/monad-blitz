const { ethers } = require('ethers');
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

async function main() {
  // Compile contract
  console.log('Compiling contract...');
  const contractPath = path.join(__dirname, '..', 'contracts', 'MonadBlitzCoins.sol');
  const outDir = path.join(__dirname, '..', 'build');
  fs.mkdirSync(outDir, { recursive: true });

  execSync(`solcjs --abi --bin --optimize -o ${outDir} ${contractPath}`, { stdio: 'inherit' });

  // Find compiled files
  const files = fs.readdirSync(outDir);
  const abiFile = files.find(f => f.endsWith('.abi'));
  const binFile = files.find(f => f.endsWith('.bin'));

  if (!abiFile || !binFile) {
    throw new Error('Compilation failed - no abi/bin files found');
  }

  const abi = JSON.parse(fs.readFileSync(path.join(outDir, abiFile), 'utf8'));
  const bytecode = '0x' + fs.readFileSync(path.join(outDir, binFile), 'utf8');

  console.log('Contract compiled successfully!');

  // Deploy
  const provider = new ethers.JsonRpcProvider('https://testnet-rpc.monad.xyz');
  const privateKey = '0x7ae86bad4547897767b4eff9e92811dd069a064dbe0e1d6522b1ef33fd316a5e';
  const wallet = new ethers.Wallet(privateKey, provider);

  console.log('Deploying from:', wallet.address);
  const balance = await provider.getBalance(wallet.address);
  console.log('Balance:', ethers.formatEther(balance), 'MON');

  const factory = new ethers.ContractFactory(abi, bytecode, wallet);
  console.log('Deploying MonadBlitzCoins...');

  const contract = await factory.deploy();
  console.log('Tx hash:', contract.deploymentTransaction().hash);

  await contract.waitForDeployment();
  const address = await contract.getAddress();

  console.log('Contract deployed at:', address);

  // Save artifacts
  const projectRoot = path.join(__dirname, '..');
  fs.writeFileSync(path.join(projectRoot, 'contract-address.txt'), address);
  fs.writeFileSync(path.join(projectRoot, 'contract-abi.json'), JSON.stringify(abi, null, 2));

  console.log('Saved contract-address.txt and contract-abi.json');
}

main().catch(console.error);
