# ✨ Monad Blitz ✨

> *A cute pixel-art 2D RPG mini-game built on Monad Testnet*

![Monad Blitz](https://img.shields.io/badge/Monad-Testnet-7B3FE4?style=for-the-badge&logo=ethereum&logoColor=white)
![Solidity](https://img.shields.io/badge/Solidity-0.8.19-363636?style=for-the-badge&logo=solidity)
![HTML5](https://img.shields.io/badge/HTML5-Canvas-E34F26?style=for-the-badge&logo=html5&logoColor=white)

```
  ╔══════════════════════════════════════╗
  ║     🟣  M O N A D   B L I T Z  🟣   ║
  ║                                      ║
  ║   Help Blitzy collect magical coins  ║
  ║      in the Monad realm!             ║
  ║                                      ║
  ║      🪙 🪙 🪙   👾 👾               ║
  ║                                      ║
  ║      ▶ PRESS ENTER TO START          ║
  ╚══════════════════════════════════════╝
```

## 🎮 What is Monad Blitz?

A cute **2D pixel-art RPG** where you control **Blitzy**, a tiny wizard adventurer, collecting magical golden coins while dodging adorable (but dangerous!) slimes. Earn enough coins and **claim them on-chain** as BLTZ tokens on Monad Testnet!

## 🕹️ How to Play

| Control | Action |
|---------|--------|
| `WASD` / `Arrow Keys` | Move Blitzy |
| Collect coins | Earn BLTZ points |
| Dodge slimes | They steal your coins! |
| Score 10+ | Unlock "Claim On-Chain" |

## 🪙 On-Chain Integration

The game features a deployed **ERC20 smart contract** on Monad Testnet:

| Detail | Value |
|--------|-------|
| **Token** | Blitz Coins (BLTZ) |
| **Contract** | `0x3A519bcc5AED78c1b70c91Ff74E7B425a8666a23` |
| **Network** | Monad Testnet (Chain ID: 10143) |
| **RPC** | `https://testnet-rpc.monad.xyz` |

### Smart Contract Features
- `claimReward(address, uint256)` — Mint BLTZ tokens to players
- `balanceOf(address)` — Check your BLTZ balance
- Full ERC20 compatibility (transfer, approve, transferFrom)

## 🏗️ Tech Stack

- **Frontend**: Pure HTML5 Canvas + Vanilla JS (zero dependencies!)
- **Smart Contract**: Solidity 0.8.19
- **Blockchain**: Monad Testnet
- **Wallet**: MetaMask integration
- **Font**: Press Start 2P (pixel-art style)
- **Hosting**: Vercel

## 🚀 Run Locally

```bash
git clone https://github.com/Scarfdrilo/monad-blitz.git
cd monad-blitz
npx serve public
```

Open `http://localhost:3000` and start collecting coins!

## 📁 Project Structure

```
monad-blitz/
├── public/
│   └── index.html        # The entire game (single file!)
├── contracts/
│   └── MonadBlitzCoins.sol  # ERC20 smart contract
├── scripts/
│   └── deploy.js         # Contract deployment script
├── contract-address.txt  # Deployed contract address
├── contract-abi.json     # Contract ABI
├── vercel.json           # Vercel config
└── README.md
```

## 🎨 Game Features

- 🧙 Cute pixel-art wizard character with walking animations
- 🪙 Sparkly spinning golden coins with glow effects
- 👾 Adorable bouncing slimes in 5 different colors
- 🗺️ Procedurally generated tile map with trees, flowers & paths
- ✨ Particle effects when collecting coins
- 💜 Purple/violet Monad-inspired color scheme
- 💖 Health system with pixel hearts
- 📱 Wallet connection + on-chain claiming
- 🎯 Screen shake on damage

## 🌐 Live Demo

Deployed on Vercel — play it now!

---

*Built with 💜 on Monad Testnet*
