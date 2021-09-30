# Coffee Supply Chain

An Ethereum DApp that demonstrates a Supply Chain flow for coffee.  A farmer can harvest, process, pack and then sell coffee to distributors. A distributer purchases items from the farmers and ships them to retailers. A retailer sells items to consumer. All data is stored in blockchain and available to everyone.


UML diagrams:

[Activity diagram](diagrams/Coffee%20Supply%20Chain%20Activity.pdf)

[State diagram](diagrams/Coffe%20Supply%20State.pdf)

[Sequence diagram](diagrams/Coffee%20Supply%20Seq.pdf)

[Class diagram](diagrams/Supply%20Chain%20Class.pdf)

## Dependencies

In order to run this product, the following tools/libraries must be installed on the dev env:

#### 1. truffle https://www.trufflesuite.com/docs/truffle/getting-started/installation

#### 2. ganache: https://www.trufflesuite.com/ganache 

#### 3. metamask plugin for chrome/brave browsers https://metamask.io/

## Installation

```
git clone https://github.com/sergfa/coffee-supply-chain.git
cd coffee-supply-chain
npm install 
```

## Configuration
Import an account into metamask wallet
```
cd [working_directory]
truffle develop
```
Copy one of the private keys and import it to metamask 

## Usage

```
cd [working_directory]
truffle develop
truffle migrate
npm run dev
```

## How to test the software

run
```
truffle test

```

## Known issues

if you get an error "Error: the tx doesn’t have the correct nonce."
Try to reset your metamask account, https://medium.com/singapore-blockchain-dapps/reset-metamask-nonce-766dd4c27ca8


## Information for udacity reviewer

Contract info on rinkeby:

transaction hash:    0x317d66ca9685abc972e7bc089f2caa3221558661c3195ccc1c5455e0f99149bf
contract address:    0x53e58CCBA70646817c1BBEacA5C9770a6861F6b0
block number:        9382153

Dev env:

Truffle v5.4.9 (core: 5.4.9)
Solidity - 0.8.7 (solc-js)
Node v14.17.6
Web3.js v1.5.2


Additional libraries for project:

"solhint":  --  used for static code analysis 
"truffle-assertions" -- used for testing solidity events
"prettier-plugin-solidity" -- used for code formatting
