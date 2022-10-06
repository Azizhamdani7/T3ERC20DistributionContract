async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    console.log("Account balance:", (await deployer.getBalance()).toString());
  
    const MAINCONTRACT = await ethers.getContractFactory("MainContract");
    console.log("Deploying Distribution");
    const instance = await MAINCONTRACT.deploy("0xb30DDb667a82c56E354fE512Fbe5bce58069317D");
    
    await instance.deployed();
  
    console.log("ERC20Token deployed at: ", instance.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });