async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", (await deployer.getBalance()).toString());
  
    const DISTRIBUTIONCONTRACT = await ethers.getContractFactory("DistributionContract");
    console.log("Deploying Distribution");
    const instance = await DISTRIBUTIONCONTRACT.deploy("0x26DDd974ec281B4Eb5bBfb3E9d0891f2d6f92935");
    
    await instance.deployed();
  
    console.log("Distribuion ERC20 Contract deployed at: ", instance.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });

    // 0xE0c68Fa3797B7e76a552e86898Af9bf2ad1B2315,0x13DE2ee396BE552FA76184846020BfaEbF349745,0xDE863EB5e0098a978412139F1CD8123FB59F5801,0xB414f451E5667D7e47f7d7C34BD2054Aa6A6105d