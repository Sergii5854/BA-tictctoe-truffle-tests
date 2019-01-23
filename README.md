# BA  TicTacTo Eth Sol

These are the solidity contracts for tictactoe Eth developed with the truffle framework.

## Installation

### Install and Run

* Run the following commands in the root directoy of the repository:
  * `npm install`
  * `truffle deploy`
  * `truffle test`

 In order to install and run this contract I really encourage you to install **[Truffle](https://github.com/trufflesuite/truffle)** and **[Ganache](https://github.com/trufflesuite/ganache)**. They make your life a lot easier, trust me.

 Once you've installed both of them , all you have to do is to start Ganache and keep it running in background, it will build a personal blockchain for you. You should see an interface like that:

 Now you need to clone the repo into your local machine and from a terminal move inside the folder downloaded and execute the command
 ```bash
truffle compile && truffle migrate --reset
 ```
 It compiles and deploy the smart contract on your personal block chain!

 At this point you need to access the truffle console to interact directly with the contract, so you just have to type:
 ```bash
truffle console
 ```
 
