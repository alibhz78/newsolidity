
const { ethers } = require("hardhat");

async function main() {

  const Token = await ethers.getContractFactory("Woas");
  const token = await Token.deploy();

  await token.deployed();

  console.log("Woas deployed to:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
