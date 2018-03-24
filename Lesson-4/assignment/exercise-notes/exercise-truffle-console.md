## truffle notes

### truffle 常用命令

```
truffle init
truffle compile
truffle migration # 部署到testrpc

truffle console # 连接到testrpc
```

### truffle console exercise

```
juicebox@juicebox:~/tmp$ truffle compile
Compiling ./contracts/ConvertLib.sol...
Compiling ./contracts/MetaCoin.sol...
Compiling ./contracts/Migrations.sol...
Writing artifacts to ./build/contracts

juicebox@juicebox:~/tmp$ ls
build  contracts  migrations  test  truffle.js
juicebox@juicebox:~/tmp$ tuffle
tuffle: command not found
juicebox@juicebox:~/tmp$ truffle migration
Using network 'development'.

Running migration: 1_initial_migration.js
  Deploying Migrations...
  ... 0xf15cd927dce598e47ef888e3cf0d08fb3e138dd9212d475cd45478173e6cc949
  Migrations: 0xf7d24e367972a82cf37436f41d0583bc24e762f8
Saving successful migration to network...
  ... 0x47535056575929aefe6ce658db5bf6baae6746ccd00e9195196e873a27814a71
Saving artifacts...
Running migration: 2_deploy_contracts.js
  Deploying ConvertLib...
  ... 0x9e8c32d30560e8add8d763f74af2ea78ab1253969238fe06cf686fcbe1184ca1
  ConvertLib: 0x1445da5776a1330f555be60e6c49e55abc39a198
  Linking ConvertLib to MetaCoin
  Deploying MetaCoin...
  ... 0xe2d93a7f002f51a45649a8220cfaefbdbfb6059ec2d18626f4b43b4a36a3678d
  MetaCoin: 0xb9cef2ef0995891a086ff055046602dcd85175bf
Saving successful migration to network...
  ... 0xda96d62bd5c6fa8cc156aaf95a239ffa10d2e7039114e9bffb914935b20957f4
Saving artifacts...
juicebox@juicebox:~/tmp$ truffle console
truffle(development)> web3.
web3.__defineGetter__      web3.__defineSetter__      web3.__lookupGetter__      web3.__lookupSetter__
web3.__proto__             web3.constructor           web3.hasOwnProperty        web3.isPrototypeOf
web3.propertyIsEnumerable  web3.toLocaleString        web3.toString              web3.valueOf

web3.BigNumber             web3.createBatch           web3.fromAscii             web3.fromDecimal
web3.fromICAP              web3.fromUtf8              web3.fromWei               web3.isAddress
web3.isChecksumAddress     web3.isConnected           web3.isIBAN                web3.padLeft
web3.padRight              web3.reset                 web3.setProvider           web3.sha3
web3.toAscii               web3.toBigNumber           web3.toChecksumAddress     web3.toDecimal
web3.toHex                 web3.toUtf8                web3.toWei

web3._extend               web3._requestManager       web3.bzz                   web3.currentProvider
web3.db                    web3.eth                   web3.net                   web3.personal
web3.providers             web3.settings              web3.shh                   web3.version

truffle(development)> web3.eth.accounts
[ '0x3251094b20bfb23a82bdc3405c2ca1c95d609f96',
  '0x1df70ed889b1d76abd10c5d5225e0e4fc144891f',
  '0x6785f349ee9b9e511961954cd0a8912742decf7f',
  '0xd149bdc8fb993027fb979e4eb4ee8edd070dcf0a',
  '0x48a1d5fbe48388dd1451d9c6cc5bb07dc9dda0b8',
  '0xb0accc46ecc559fc584c92ae8f931cf72adba6d8',
  '0x8ed4204c9ec4ed989f47231ad9227b168f77f6eb',
  '0x1b82be3045d92d07e72a51827471036b45637b89',
  '0x48ea93acad23786de42cbbb3215c9977d3fcba75',
  '0x01bcd26731de444bb7b8c8349b831544ace79b6e' ]
truffle(development)> web3.
web3.__defineGetter__      web3.__defineSetter__      web3.__lookupGetter__      web3.__lookupSetter__
web3.__proto__             web3.constructor           web3.hasOwnProperty        web3.isPrototypeOf
web3.propertyIsEnumerable  web3.toLocaleString        web3.toString              web3.valueOf

web3.BigNumber             web3.createBatch           web3.fromAscii             web3.fromDecimal
web3.fromICAP              web3.fromUtf8              web3.fromWei               web3.isAddress
web3.isChecksumAddress     web3.isConnected           web3.isIBAN                web3.padLeft
web3.padRight              web3.reset                 web3.setProvider           web3.sha3
web3.toAscii               web3.toBigNumber           web3.toChecksumAddress     web3.toDecimal
web3.toHex                 web3.toUtf8                web3.toWei

web3._extend               web3._requestManager       web3.bzz                   web3.currentProvider
web3.db                    web3.eth                   web3.net                   web3.personal
web3.providers             web3.settings              web3.shh                   web3.version

truffle(development)> web3.currentProvider
HttpProvider {
  host: 'http://localhost:8545',
  timeout: 0,
  send: [Function],
  sendAsync: [Function],
  _alreadyWrapped: true }
truffle(development)> web3.personal.
web3.personal.__defineGetter__      web3.personal.__defineSetter__      web3.personal.__lookupGetter__
web3.personal.__lookupSetter__      web3.personal.__proto__             web3.personal.constructor
web3.personal.hasOwnProperty        web3.personal.isPrototypeOf         web3.personal.propertyIsEnumerable
web3.personal.toLocaleString        web3.personal.toString              web3.personal.valueOf

web3.personal._requestManager       web3.personal.ecRecover             web3.personal.getListAccounts
web3.personal.importRawKey          web3.personal.listAccounts          web3.personal.lockAccount
web3.personal.newAccount            web3.personal.sendTransaction       web3.personal.sign
web3.personal.unlockAccount

truffle(development)> web3.personal.newAccount
{ [Function: send] request: [Function: bound ], call: 'personal_newAccount' }
truffle(development)> web3.personal.newAccount()
'0x2c95fb0cf3fe24d3fa9c4f50bfa76e0c3e60b04f'
truffle(development)> web3.eth.
web3.eth.__defineGetter__          web3.eth.__defineSetter__          web3.eth.__lookupGetter__
web3.eth.__lookupSetter__          web3.eth.__proto__                 web3.eth.constructor
web3.eth.hasOwnProperty            web3.eth.isPrototypeOf             web3.eth.propertyIsEnumerable
web3.eth.toLocaleString            web3.eth.toString                  web3.eth.valueOf

web3.eth.contract                  web3.eth.defaultAccount            web3.eth.defaultBlock
web3.eth.filter                    web3.eth.icapNamereg               web3.eth.isSyncing
web3.eth.namereg

web3.eth._requestManager           web3.eth.accounts                  web3.eth.blockNumber
web3.eth.call                      web3.eth.coinbase                  web3.eth.compile
web3.eth.estimateGas               web3.eth.gasPrice                  web3.eth.getAccounts
web3.eth.getBalance                web3.eth.getBlock                  web3.eth.getBlockNumber
web3.eth.getBlockTransactionCount  web3.eth.getBlockUncleCount        web3.eth.getCode
web3.eth.getCoinbase               web3.eth.getCompilers              web3.eth.getGasPrice
web3.eth.getHashrate               web3.eth.getMining                 web3.eth.getProtocolVersion
web3.eth.getStorageAt              web3.eth.getSyncing                web3.eth.getTransaction
web3.eth.getTransactionCount       web3.eth.getTransactionFromBlock   web3.eth.getTransactionReceipt
web3.eth.getUncle                  web3.eth.getWork                   web3.eth.hashrate
web3.eth.iban                      web3.eth.mining                    web3.eth.protocolVersion
web3.eth.sendIBANTransaction       web3.eth.sendRawTransaction        web3.eth.sendTransaction
web3.eth.sign                      web3.eth.signTransaction           web3.eth.submitWork
web3.eth.syncing

truffle(development)> web3.eth.accounts
[ '0x3251094b20bfb23a82bdc3405c2ca1c95d609f96',
  '0x1df70ed889b1d76abd10c5d5225e0e4fc144891f',
  '0x6785f349ee9b9e511961954cd0a8912742decf7f',
  '0xd149bdc8fb993027fb979e4eb4ee8edd070dcf0a',
  '0x48a1d5fbe48388dd1451d9c6cc5bb07dc9dda0b8',
  '0xb0accc46ecc559fc584c92ae8f931cf72adba6d8',
  '0x8ed4204c9ec4ed989f47231ad9227b168f77f6eb',
  '0x1b82be3045d92d07e72a51827471036b45637b89',
  '0x48ea93acad23786de42cbbb3215c9977d3fcba75',
  '0x01bcd26731de444bb7b8c8349b831544ace79b6e',
  '0x2c95fb0cf3fe24d3fa9c4f50bfa76e0c3e60b04f' ]
truffle(development)> web3.settings.
web3.settings.__defineGetter__      web3.settings.__defineSetter__      web3.settings.__lookupGetter__
web3.settings.__lookupSetter__      web3.settings.__proto__             web3.settings.constructor
web3.settings.hasOwnProperty        web3.settings.isPrototypeOf         web3.settings.propertyIsEnumerable
web3.settings.toLocaleString        web3.settings.toString              web3.settings.valueOf

web3.settings.defaultAccount        web3.settings.defaultBlock

truffle(development)> web3.settings.de
web3.settings.defaultAccount  web3.settings.defaultBlock

truffle(development)> web3.settings.default
web3.settings.defaultAccount  web3.settings.defaultBlock

truffle(development)> web3.settings.defaultAccount()
TypeError: web3.settings.defaultAccount is not a function
    at evalmachine.<anonymous>:1:15
    at ContextifyScript.Script.runInContext (vm.js:35:29)
    at Object.runInContext (vm.js:89:6)
    at TruffleInterpreter.interpret (/home/juicebox/.nvm/versions/node/v6.11.3/lib/node_modules/truffle/build/cli.bundled.js:213786:17)
    at bound (domain.js:280:14)
    at REPLServer.runBound [as eval] (domain.js:293:12)
    at REPLServer.<anonymous> (repl.js:538:10)
    at emitOne (events.js:96:13)
    at REPLServer.emit (events.js:188:7)
    at REPLServer.Interface._onLine (readline.js:233:10)
truffle(development)> web3.eth.
web3.eth.__defineGetter__          web3.eth.__defineSetter__          web3.eth.__lookupGetter__
web3.eth.__lookupSetter__          web3.eth.__proto__                 web3.eth.constructor
web3.eth.hasOwnProperty            web3.eth.isPrototypeOf             web3.eth.propertyIsEnumerable
web3.eth.toLocaleString            web3.eth.toString                  web3.eth.valueOf

web3.eth.contract                  web3.eth.defaultAccount            web3.eth.defaultBlock
web3.eth.filter                    web3.eth.icapNamereg               web3.eth.isSyncing
web3.eth.namereg

web3.eth._requestManager           web3.eth.accounts                  web3.eth.blockNumber
web3.eth.call                      web3.eth.coinbase                  web3.eth.compile
web3.eth.estimateGas               web3.eth.gasPrice                  web3.eth.getAccounts
web3.eth.getBalance                web3.eth.getBlock                  web3.eth.getBlockNumber
web3.eth.getBlockTransactionCount  web3.eth.getBlockUncleCount        web3.eth.getCode
web3.eth.getCoinbase               web3.eth.getCompilers              web3.eth.getGasPrice
web3.eth.getHashrate               web3.eth.getMining                 web3.eth.getProtocolVersion
web3.eth.getStorageAt              web3.eth.getSyncing                web3.eth.getTransaction
web3.eth.getTransactionCount       web3.eth.getTransactionFromBlock   web3.eth.getTransactionReceipt
web3.eth.getUncle                  web3.eth.getWork                   web3.eth.hashrate
web3.eth.iban                      web3.eth.mining                    web3.eth.protocolVersion
web3.eth.sendIBANTransaction       web3.eth.sendRawTransaction        web3.eth.sendTransaction
web3.eth.sign                      web3.eth.signTransaction           web3.eth.submitWork
web3.eth.syncing

truffle(development)> web3.eth.
web3.eth.__defineGetter__          web3.eth.__defineSetter__          web3.eth.__lookupGetter__
web3.eth.__lookupSetter__          web3.eth.__proto__                 web3.eth.constructor
web3.eth.hasOwnProperty            web3.eth.isPrototypeOf             web3.eth.propertyIsEnumerable
web3.eth.toLocaleString            web3.eth.toString                  web3.eth.valueOf

web3.eth.contract                  web3.eth.defaultAccount            web3.eth.defaultBlock
web3.eth.filter                    web3.eth.icapNamereg               web3.eth.isSyncing
web3.eth.namereg

web3.eth._requestManager           web3.eth.accounts                  web3.eth.blockNumber
web3.eth.call                      web3.eth.coinbase                  web3.eth.compile
web3.eth.estimateGas               web3.eth.gasPrice                  web3.eth.getAccounts
web3.eth.getBalance                web3.eth.getBlock                  web3.eth.getBlockNumber
web3.eth.getBlockTransactionCount  web3.eth.getBlockUncleCount        web3.eth.getCode
web3.eth.getCoinbase               web3.eth.getCompilers              web3.eth.getGasPrice
web3.eth.getHashrate               web3.eth.getMining                 web3.eth.getProtocolVersion
web3.eth.getStorageAt              web3.eth.getSyncing                web3.eth.getTransaction
web3.eth.getTransactionCount       web3.eth.getTransactionFromBlock   web3.eth.getTransactionReceipt
web3.eth.getUncle                  web3.eth.getWork                   web3.eth.hashrate
web3.eth.iban                      web3.eth.mining                    web3.eth.protocolVersion
web3.eth.sendIBANTransaction       web3.eth.sendRawTransaction        web3.eth.sendTransaction
web3.eth.sign                      web3.eth.signTransaction           web3.eth.submitWork
web3.eth.syncing

truffle(development)> MetaCoin.
MetaCoin.__defineGetter__      MetaCoin.__defineSetter__      MetaCoin.__lookupGetter__      MetaCoin.__lookupSetter__
MetaCoin.__proto__             MetaCoin.constructor           MetaCoin.hasOwnProperty        MetaCoin.isPrototypeOf
MetaCoin.propertyIsEnumerable  MetaCoin.toLocaleString        MetaCoin.toString              MetaCoin.valueOf

MetaCoin.apply                 MetaCoin.arguments             MetaCoin.bind                  MetaCoin.call
MetaCoin.caller                MetaCoin.length                MetaCoin.name

MetaCoin._json                 MetaCoin._properties           MetaCoin._property_values      MetaCoin._static_methods
MetaCoin.abi                   MetaCoin.addProp               MetaCoin.address               MetaCoin.at
MetaCoin.binary                MetaCoin.class_defaults        MetaCoin.clone                 MetaCoin.contract_name
MetaCoin.currentProvider       MetaCoin.defaults              MetaCoin.deployed              MetaCoin.detectNetwork
MetaCoin.events                MetaCoin.hasNetwork            MetaCoin.isDeployed            MetaCoin.link
MetaCoin.links                 MetaCoin.network               MetaCoin.network_id            MetaCoin.networks
MetaCoin.new                   MetaCoin.prototype             MetaCoin.resetAddress          MetaCoin.schema_version
MetaCoin.setNetwork            MetaCoin.setProvider           MetaCoin.toJSON                MetaCoin.unlinked_binary
MetaCoin.updated_at            MetaCoin.web3

truffle(development)> MetaCoin.abi()
TypeError: MetaCoin.abi is not a function
    at evalmachine.<anonymous>:1:10
    at ContextifyScript.Script.runInContext (vm.js:35:29)
    at Object.runInContext (vm.js:89:6)
    at TruffleInterpreter.interpret (/home/juicebox/.nvm/versions/node/v6.11.3/lib/node_modules/truffle/build/cli.bundled.js:213786:17)
    at bound (domain.js:280:14)
    at REPLServer.runBound [as eval] (domain.js:293:12)
    at REPLServer.<anonymous> (repl.js:538:10)
    at emitOne (events.js:96:13)
    at REPLServer.emit (events.js:188:7)
    at REPLServer.Interface._onLine (readline.js:233:10)
truffle(development)> MetaCoin.abi
[ { constant: false,
    inputs: [ [Object] ],
    name: 'getBalanceInEth',
    outputs: [ [Object] ],
    payable: false,
    type: 'function' },
  { constant: false,
    inputs: [ [Object], [Object] ],
    name: 'sendCoin',
    outputs: [ [Object] ],
    payable: false,
    type: 'function' },
  { constant: false,
    inputs: [ [Object] ],
    name: 'getBalance',
    outputs: [ [Object] ],
    payable: false,
    type: 'function' },
  { inputs: [], payable: false, type: 'constructor' },
  { anonymous: false,
    inputs: [ [Object], [Object], [Object] ],
    name: 'Transfer',
    type: 'event' } ]
truffle(development)> MetaCoin.
MetaCoin.__defineGetter__      MetaCoin.__defineSetter__      MetaCoin.__lookupGetter__      MetaCoin.__lookupSetter__
MetaCoin.__proto__             MetaCoin.constructor           MetaCoin.hasOwnProperty        MetaCoin.isPrototypeOf
MetaCoin.propertyIsEnumerable  MetaCoin.toLocaleString        MetaCoin.toString              MetaCoin.valueOf

MetaCoin.apply                 MetaCoin.arguments             MetaCoin.bind                  MetaCoin.call
MetaCoin.caller                MetaCoin.length                MetaCoin.name

MetaCoin._json                 MetaCoin._properties           MetaCoin._property_values      MetaCoin._static_methods
MetaCoin.abi                   MetaCoin.addProp               MetaCoin.address               MetaCoin.at
MetaCoin.binary                MetaCoin.class_defaults        MetaCoin.clone                 MetaCoin.contract_name
MetaCoin.currentProvider       MetaCoin.defaults              MetaCoin.deployed              MetaCoin.detectNetwork
MetaCoin.events                MetaCoin.hasNetwork            MetaCoin.isDeployed            MetaCoin.link
MetaCoin.links                 MetaCoin.network               MetaCoin.network_id            MetaCoin.networks
MetaCoin.new                   MetaCoin.prototype             MetaCoin.resetAddress          MetaCoin.schema_version
MetaCoin.setNetwork            MetaCoin.setProvider           MetaCoin.toJSON                MetaCoin.unlinked_binary
MetaCoin.updated_at            MetaCoin.web3

truffle(development)> MetaCoin.deployed().then(contract => { metacoin = contract })
undefined
truffle(development)> metacoin
TruffleContract {
  constructor:
   { [Function: TruffleContract]
     _static_methods:
      { setProvider: [Function: setProvider],
        new: [Function: new],
        at: [Function: at],
        deployed: [Function: deployed],
        defaults: [Function: defaults],
        hasNetwork: [Function: hasNetwork],
        isDeployed: [Function: isDeployed],
        detectNetwork: [Function: detectNetwork],
        setNetwork: [Function: setNetwork],
        resetAddress: [Function: resetAddress],
        link: [Function: link],
        clone: [Function: clone],
        addProp: [Function: addProp],
        toJSON: [Function: toJSON] },
     _properties:
      { contract_name: [Object],
        abi: [Object],
        network: [Function: network],
        networks: [Function: networks],
        address: [Object],
        links: [Function: links],
        events: [Function: events],
        binary: [Function: binary],
        unlinked_binary: [Object],
        schema_version: [Function: schema_version],
        updated_at: [Function: updated_at] },
     _property_values: {},
     _json:
      { contract_name: 'MetaCoin',
        default_network: undefined,
        abi: [Object],
        unlinked_binary: '0x6060604052341561000f57600080fd5b5b600160a060020a033216600090815260208190526040902061271090555b5b6102728061003e6000396000f300606060405263ffffffff7c01000000000000000000000000000000000000000000000000000000006000350416637bd703e8811461005357806390b98a1114610084578063f8b2cb4f146100ba575b600080fd5b341561005e57600080fd5b610072600160a060020a03600435166100eb565b60405190815260200160405180910390f35b341561008f57600080fd5b6100a6600160a060020a036004351660243561018f565b604051901515815260200160405180910390f35b34156100c557600080fd5b610072600160a060020a0360043516610227565b60405190815260200160405180910390f35b600073__ConvertLib____________________________6396e4ee3d61011084610227565b60026000604051602001526040517c010000000000000000000000000000000000000000000000000000000063ffffffff85160281526004810192909252602482015260440160206040518083038186803b151561016d57600080fd5b6102c65a03f4151561017e57600080fd5b50505060405180519150505b919050565b600160a060020a033316600090815260208190526040812054829010156101b857506000610221565b600160a060020a033381166000818152602081905260408082208054879003905592861680825290839020805486019055917fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef9085905190815260200160405180910390a35060015b92915050565b600160a060020a0381166000908152602081905260409020545b9190505600a165627a7a7230582077ec9ba3e41f02585563b41b9e2314bed29a9a64baf2c9fccb2f1b115176f9d60029',
        networks: [Object],
        schema_version: '0.0.5',
        updated_at: 1521889737497 },
     setProvider: [Function: bound setProvider],
     new: [Function: bound new],
     at: [Function: bound at],
     deployed: [Function: bound deployed],
     defaults: [Function: bound defaults],
     hasNetwork: [Function: bound hasNetwork],
     isDeployed: [Function: bound isDeployed],
     detectNetwork: [Function: bound detectNetwork],
     setNetwork: [Function: bound setNetwork],
     resetAddress: [Function: bound resetAddress],
     link: [Function: bound link],
     clone: [Function: bound clone],
     addProp: [Function: bound addProp],
     toJSON: [Function: bound toJSON],
     web3:
      Web3 {
        _requestManager: [Object],
        currentProvider: [Object],
        eth: [Object],
        db: [Object],
        shh: [Object],
        net: [Object],
        personal: [Object],
        bzz: [Object],
        settings: [Object],
        version: [Object],
        providers: [Object],
        _extend: [Object] },
     class_defaults:
      { from: '0x3251094b20bfb23a82bdc3405c2ca1c95d609f96',
        gas: 4712388,
        gasPrice: 100000000000 },
     currentProvider:
      HttpProvider {
        host: 'http://localhost:8545',
        timeout: 0,
        send: [Function],
        sendAsync: [Function],
        _alreadyWrapped: true },
     network_id: '1521887229562' },
  abi:
   [ { constant: false,
       inputs: [Object],
       name: 'getBalanceInEth',
       outputs: [Object],
       payable: false,
       type: 'function' },
     { constant: false,
       inputs: [Object],
       name: 'sendCoin',
       outputs: [Object],
       payable: false,
       type: 'function' },
     { constant: false,
       inputs: [Object],
       name: 'getBalance',
       outputs: [Object],
       payable: false,
       type: 'function' },
     { inputs: [], payable: false, type: 'constructor' },
     { anonymous: false,
       inputs: [Object],
       name: 'Transfer',
       type: 'event' } ],
  contract:
   Contract {
     _eth:
      Eth {
        _requestManager: [Object],
        getBalance: [Object],
        getStorageAt: [Object],
        getCode: [Object],
        getBlock: [Object],
        getUncle: [Object],
        getCompilers: [Object],
        getBlockTransactionCount: [Object],
        getBlockUncleCount: [Object],
        getTransaction: [Object],
        getTransactionFromBlock: [Object],
        getTransactionReceipt: [Object],
        getTransactionCount: [Object],
        call: [Object],
        estimateGas: [Object],
        sendRawTransaction: [Object],
        signTransaction: [Object],
        sendTransaction: [Object],
        sign: [Object],
        compile: [Object],
        submitWork: [Object],
        getWork: [Object],
        coinbase: [Getter],
        getCoinbase: [Object],
        mining: [Getter],
        getMining: [Object],
        hashrate: [Getter],
        getHashrate: [Object],
        syncing: [Getter],
        getSyncing: [Object],
        gasPrice: [Getter],
        getGasPrice: [Object],
        accounts: [Getter],
        getAccounts: [Object],
        blockNumber: [Getter],
        getBlockNumber: [Object],
        protocolVersion: [Getter],
        getProtocolVersion: [Object],
        iban: [Object],
        sendIBANTransaction: [Function: bound transfer] },
     transactionHash: null,
     address: '0xb9cef2ef0995891a086ff055046602dcd85175bf',
     abi: [ [Object], [Object], [Object], [Object], [Object] ],
     getBalanceInEth:
      { [Function: bound ]
        request: [Function: bound ],
        call: [Function: bound ],
        sendTransaction: [Function: bound ],
        estimateGas: [Function: bound ],
        getData: [Function: bound ],
        address: [Circular] },
     sendCoin:
      { [Function: bound ]
        request: [Function: bound ],
        call: [Function: bound ],
        sendTransaction: [Function: bound ],
        estimateGas: [Function: bound ],
        getData: [Function: bound ],
        'address,uint256': [Circular] },
     getBalance:
      { [Function: bound ]
        request: [Function: bound ],
        call: [Function: bound ],
        sendTransaction: [Function: bound ],
        estimateGas: [Function: bound ],
        getData: [Function: bound ],
        address: [Circular] },
     allEvents: [Function: bound ],
     Transfer: { [Function: bound ] 'address,address,uint256': [Function: bound ] } },
  getBalanceInEth:
   { [Function]
     call: [Function],
     sendTransaction: [Function],
     request: [Function: bound ],
     estimateGas: [Function] },
  sendCoin:
   { [Function]
     call: [Function],
     sendTransaction: [Function],
     request: [Function: bound ],
     estimateGas: [Function] },
  getBalance:
   { [Function]
     call: [Function],
     sendTransaction: [Function],
     request: [Function: bound ],
     estimateGas: [Function] },
  Transfer: { [Function: bound ] 'address,address,uint256': [Function: bound ] },
  sendTransaction: [Function],
  send: [Function],
  allEvents: [Function: bound ],
  address: '0xb9cef2ef0995891a086ff055046602dcd85175bf',
  transactionHash: null }
truffle(development)> web3.eth.
web3.eth.__defineGetter__          web3.eth.__defineSetter__          web3.eth.__lookupGetter__
web3.eth.__lookupSetter__          web3.eth.__proto__                 web3.eth.constructor
web3.eth.hasOwnProperty            web3.eth.isPrototypeOf             web3.eth.propertyIsEnumerable
web3.eth.toLocaleString            web3.eth.toString                  web3.eth.valueOf

web3.eth.contract                  web3.eth.defaultAccount            web3.eth.defaultBlock
web3.eth.filter                    web3.eth.icapNamereg               web3.eth.isSyncing
web3.eth.namereg

web3.eth._requestManager           web3.eth.accounts                  web3.eth.blockNumber
web3.eth.call                      web3.eth.coinbase                  web3.eth.compile
web3.eth.estimateGas               web3.eth.gasPrice                  web3.eth.getAccounts
web3.eth.getBalance                web3.eth.getBlock                  web3.eth.getBlockNumber
web3.eth.getBlockTransactionCount  web3.eth.getBlockUncleCount        web3.eth.getCode
web3.eth.getCoinbase               web3.eth.getCompilers              web3.eth.getGasPrice
web3.eth.getHashrate               web3.eth.getMining                 web3.eth.getProtocolVersion
web3.eth.getStorageAt              web3.eth.getSyncing                web3.eth.getTransaction
web3.eth.getTransactionCount       web3.eth.getTransactionFromBlock   web3.eth.getTransactionReceipt
web3.eth.getUncle                  web3.eth.getWork                   web3.eth.hashrate
web3.eth.iban                      web3.eth.mining                    web3.eth.protocolVersion
web3.eth.sendIBANTransaction       web3.eth.sendRawTransaction        web3.eth.sendTransaction
web3.eth.sign                      web3.eth.signTransaction           web3.eth.submitWork
web3.eth.syncing

truffle(development)> web3.eth.accounts
[ '0x3251094b20bfb23a82bdc3405c2ca1c95d609f96',
  '0x1df70ed889b1d76abd10c5d5225e0e4fc144891f',
  '0x6785f349ee9b9e511961954cd0a8912742decf7f',
  '0xd149bdc8fb993027fb979e4eb4ee8edd070dcf0a',
  '0x48a1d5fbe48388dd1451d9c6cc5bb07dc9dda0b8',
  '0xb0accc46ecc559fc584c92ae8f931cf72adba6d8',
  '0x8ed4204c9ec4ed989f47231ad9227b168f77f6eb',
  '0x1b82be3045d92d07e72a51827471036b45637b89',
  '0x48ea93acad23786de42cbbb3215c9977d3fcba75',
  '0x01bcd26731de444bb7b8c8349b831544ace79b6e',
  '0x2c95fb0cf3fe24d3fa9c4f50bfa76e0c3e60b04f' ]
truffle(development)> metacoin.
metacoin.__defineGetter__      metacoin.__defineSetter__      metacoin.__lookupGetter__      metacoin.__lookupSetter__
metacoin.__proto__             metacoin.constructor           metacoin.hasOwnProperty        metacoin.isPrototypeOf
metacoin.propertyIsEnumerable  metacoin.toLocaleString        metacoin.toString              metacoin.valueOf

metacoin.Transfer              metacoin.abi                   metacoin.address               metacoin.allEvents
metacoin.contract              metacoin.getBalance            metacoin.getBalanceInEth       metacoin.send
metacoin.sendCoin              metacoin.sendTransaction       metacoin.transactionHash

truffle(development)> metacoin.getB
metacoin.getBalance       metacoin.getBalanceInEth

truffle(development)> metacoin.getBalance.call('0x3251094b20bfb23a82bdc3405c2ca1c95d609f96').then(result => {console.log(result)})
{ [String: '10000'] s: 1, e: 4, c: [ 10000 ] }
undefined
truffle(development)> metacoin.sendCoin('0x1df70ed889b1d76abd10c5d5225e0e4fc144891f', 5).then(result => {console.log(result)})
{ tx: '0xef912badf7e1830fb624f7d7f14f750dd7457e62a3953a595a29550134d4e60f',
  receipt:
   { transactionHash: '0xef912badf7e1830fb624f7d7f14f750dd7457e62a3953a595a29550134d4e60f',
     transactionIndex: 0,
     blockHash: '0x004524b34b07cb52ef59e8cde2539d3089058a9ff14541d262d5af69f521ec8a',
     blockNumber: 6,
     gasUsed: 50982,
     cumulativeGasUsed: 50982,
     contractAddress: null,
     logs: [ [Object] ] },
  logs:
   [ { logIndex: 0,
       transactionIndex: 0,
       transactionHash: '0xef912badf7e1830fb624f7d7f14f750dd7457e62a3953a595a29550134d4e60f',
       blockHash: '0x004524b34b07cb52ef59e8cde2539d3089058a9ff14541d262d5af69f521ec8a',
       blockNumber: 6,
       address: '0xb9cef2ef0995891a086ff055046602dcd85175bf',
       type: 'mined',
       event: 'Transfer',
       args: [Object] } ] }
undefined
truffle(development)> metacoin.sendCoin.call('0x1df70ed889b1d76abd10c5d5225e0e4fc144891f', 5).then(result => {console.log(result)})
true
undefined
truffle(development)> metacoin.getBalance.call('0x1df70ed889b1d76abd10c5d5225e0e4fc144891f').then(result => {console.log(result)})
{ [String: '5'] s: 1, e: 0, c: [ 5 ] }
undefined
truffle(development)> metacoin.sendCoin.call('0x1df70ed889b1d76abd10c5d5225e0e4fc144891f', 5).then(result => {console.log(result)})
true
undefined
truffle(development)> metacoin.getBalance.call('0x1df70ed889b1d76abd10c5d5225e0e4fc144891f').then(result => {console.log(result)})
{ [String: '5'] s: 1, e: 0, c: [ 5 ] }
undefined
truffle(development)>
```
