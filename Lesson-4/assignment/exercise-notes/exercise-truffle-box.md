## truffle box

### 常用命令

```
truffle unbox react # 生成React工程脚手架 （对标普通truffle工程的truffle init）
truffle compile # 编译工程
truffle test # 运行测试用例 （需连接testrpc）
npm run start # 启动react
```

### truffle box exercise

```
juicebox@juicebox:~/tmp2$ ls
juicebox@juicebox:~/tmp2$ truffle unbox react
Downloading...
Unpacking...
Setting up...
Unbox successful. Sweet!

Commands:

  Compile:              truffle compile
  Migrate:              truffle migrate
  Test contracts:       truffle test
  Test dapp:            npm test
  Run dev server:       npm run start
  Build for production: npm run build
juicebox@juicebox:~/tmp2$ ls
box-img-lg.png  config     migrations    package.json  scripts  test               truffle.js
box-img-sm.png  contracts  node_modules  public        src      truffle-config.js
juicebox@juicebox:~/tmp2$ ls *
box-img-lg.png  box-img-sm.png  package.json  truffle-config.js  truffle.js

config:
env.js  jest  paths.js  polyfills.js  webpack.config.dev.js  webpack.config.prod.js

contracts:
Migrations.sol  SimpleStorage.sol

migrations:
1_initial_migration.js  2_deploy_contracts.js

node_modules:
abab                                                     eslint-plugin-flowtype       number-to-bn
abbrev                                                   eslint-plugin-import         nwmatcher
abstract-leveldown                                       eslint-plugin-jsx-a11y       oauth-sign
accepts                                                  eslint-plugin-react          object-assign
acorn                                                    espree                       object-inspect
acorn-globals                                            esprima                      object-keys
acorn-jsx                                                esrecurse                    object.omit
acorn-node                                               es-to-primitive              once
aes-js                                                   estraverse                   onetime
ajv                                                      esutils                      on-finished
ajv-keywords                                             etag                         on-headers
align-text                                               ethereum-common              open
alphanum-sort                                            ethereumjs-account           opn
amdefine                                                 ethereumjs-block             optimist
ansicolors                                               ethereumjs-testrpc           optionator
ansi-escapes                                             ethereumjs-tx                original
ansi-html                                                ethereumjs-util              os-browserify
ansi-regex                                               ethereumjs-vm                osenv
ansi-styles                                              ethereumjs-wallet            os-homedir
anymatch                                                 ether-pudding                os-locale
append-transform                                         ethjs-abi                    os-tmpdir
aproba                                                   ethjs-util                   pako
are-we-there-yet                                         event-emitter                param-case
argparse                                                 eventemitter3                parents
array-equal                                              events                       parse5
array-filter                                             eventsource                  parse-asn1
array-find-index                                         evp_bytestokey               parse-glob
array-flatten                                            exec-sh                      parse-headers
array-map                                                exit-hook                    parse-json
array-reduce                                             expand-brackets              parseurl
array-union                                              expand-range                 path-browserify
array-uniq                                               express                      path-exists
array-unique                                             extend                       path-is-absolute
arr-diff                                                 extglob                      path-is-inside
arr-flatten                                              extract-text-webpack-plugin  path-parse
arrify                                                   extsprintf                   path-platform
asap                                                     fake-merkle-patricia-tree    path-to-regexp
asn1                                                     fast-deep-equal              path-type
asn1.js                                                  fast-json-stable-stringify   pbkdf2
assert                                                   fast-levenshtein             pbkdf2-compat
assertion-error                                          fastparse                    pegjs
assert-plus                                              faye-websocket               performance-now
astw                                                     fbjs                         pify
async                                                    fb-watchman                  pinkie
async-each                                               figures                      pinkie-promise
async-eventemitter                                       file-entry-cache             pkg-dir
async-foreach                                            file-loader                  pkg-up
asynckit                                                 filename-regex               pluralize
autoprefixer                                             fileset                      postcss
aws4                                                     filesize                     postcss-calc
aws-sign2                                                fill-range                   postcss-colormin
babel-code-frame                                         finalhandler                 postcss-convert-values
babel-core                                               find-cache-dir               postcss-discard-comments
babel-eslint                                             findup                       postcss-discard-duplicates
babel-generator                                          find-up                      postcss-discard-empty
babel-helper-bindify-decorators                          flat-cache                   postcss-discard-overridden
babel-helper-builder-binary-assignment-operator-visitor  flatten                      postcss-discard-unused
babel-helper-builder-react-jsx                           foreach                      postcss-filter-plugins
babel-helper-call-delegate                               for-each                     postcss-load-config
babel-helper-define-map                                  forever-agent                postcss-loader
babel-helper-explode-assignable-expression               for-in                       postcss-load-options
babel-helper-explode-class                               form-data                    postcss-load-plugins
babel-helper-function-name                               for-own                      postcss-merge-idents
babel-helper-get-function-arity                          forwarded                    postcss-merge-longhand
babel-helper-hoist-variables                             fresh                        postcss-merge-rules
babel-helper-optimise-call-expression                    fs-extra                     postcss-message-helpers
babel-helper-regex                                       fs.realpath                  postcss-minify-font-values
babel-helper-remap-async-to-generator                    fstream                      postcss-minify-gradients
babel-helper-replace-supers                              functional-red-black-tree    postcss-minify-params
babel-helpers                                            function-bind                postcss-minify-selectors
babel-jest                                               gauge                        postcss-modules-extract-imports
babel-loader                                             gaze                         postcss-modules-local-by-default
babel-messages                                           generate-function            postcss-modules-scope
babel-plugin-check-es2015-constants                      generate-object-property     postcss-modules-values
babel-plugin-istanbul                                    get-caller-file              postcss-normalize-charset
babel-plugin-jest-hoist                                  getpass                      postcss-normalize-url
babel-plugin-syntax-async-functions                      get-stdin                    postcss-ordered-values
babel-plugin-syntax-async-generators                     glob                         postcss-reduce-idents
babel-plugin-syntax-class-properties                     global                       postcss-reduce-initial
babel-plugin-syntax-decorators                           globals                      postcss-reduce-transforms
babel-plugin-syntax-dynamic-import                       glob-base                    postcss-selector-parser
babel-plugin-syntax-exponentiation-operator              globby                       postcss-svgo
babel-plugin-syntax-flow                                 glob-parent                  postcss-unique-selectors
babel-plugin-syntax-jsx                                  globule                      postcss-value-parser
babel-plugin-syntax-object-rest-spread                   graceful-fs                  postcss-zindex
babel-plugin-syntax-trailing-function-commas             graceful-readlink            prelude-ls
babel-plugin-transform-async-generator-functions         graphlib                     prepend-http
babel-plugin-transform-async-to-generator                growl                        preserve
babel-plugin-transform-class-properties                  growly                       pretty-error
babel-plugin-transform-decorators                        gzip-size                    pretty-format
babel-plugin-transform-es2015-arrow-functions            handlebars                   private
babel-plugin-transform-es2015-block-scoped-functions     har-schema                   process
babel-plugin-transform-es2015-block-scoping              har-validator                process-nextick-args
babel-plugin-transform-es2015-classes                    has                          progress
babel-plugin-transform-es2015-computed-properties        has-ansi                     promise
babel-plugin-transform-es2015-destructuring              has-flag                     prop-types
babel-plugin-transform-es2015-duplicate-keys             hash-base                    proxy-addr
babel-plugin-transform-es2015-for-of                     hash.js                      prr
babel-plugin-transform-es2015-function-name              has-unicode                  pseudomap
babel-plugin-transform-es2015-literals                   hawk                         public-encrypt
babel-plugin-transform-es2015-modules-amd                hdkey                        punycode
babel-plugin-transform-es2015-modules-commonjs           he                           q
babel-plugin-transform-es2015-modules-systemjs           hmac-drbg                    qs
babel-plugin-transform-es2015-modules-umd                hoek                         querystring
babel-plugin-transform-es2015-object-super               home-or-tmp                  query-string
babel-plugin-transform-es2015-parameters                 hosted-git-info              querystring-es3
babel-plugin-transform-es2015-shorthand-properties       html-comment-regex           querystringify
babel-plugin-transform-es2015-spread                     html-encoding-sniffer        randomatic
babel-plugin-transform-es2015-sticky-regex               html-entities                randombytes
babel-plugin-transform-es2015-template-literals          htmlescape                   randomfill
babel-plugin-transform-es2015-typeof-symbol              html-minifier                range-parser
babel-plugin-transform-es2015-unicode-regex              htmlparser2                  raw-body
babel-plugin-transform-exponentiation-operator           html-webpack-plugin          react
babel-plugin-transform-flow-strip-types                  http-errors                  react-dev-utils
babel-plugin-transform-object-rest-spread                http-parser-js               react-dom
babel-plugin-transform-react-constant-elements           http-proxy                   readable-stream
babel-plugin-transform-react-display-name                http-proxy-middleware        readdirp
babel-plugin-transform-react-jsx                         https-browserify             readline2
babel-plugin-transform-react-jsx-self                    http-signature               read-only-stream
babel-plugin-transform-react-jsx-source                  iconv-lite                   read-pkg
babel-plugin-transform-regenerator                       icss-replace-symbols         read-pkg-up
babel-plugin-transform-runtime                           ieee754                      recursive-readdir
babel-plugin-transform-strict-mode                       ignore                       redent
babel-polyfill                                           immediate                    redeyed
babel-preset-env                                         imurmurhash                  reduce-css-calc
babel-preset-es2015                                      indent-string                reduce-function-call
babel-preset-jest                                        indexes-of                   regenerate
babel-preset-react                                       indexof                      regenerator-runtime
babel-preset-react-app                                   inflight                     regenerator-transform
babel-preset-stage-2                                     inherits                     regex-cache
babel-preset-stage-3                                     inline-source-map            regexpu-core
babel-register                                           in-publish                   regjsgen
babel-runtime                                            inquirer                     regjsparser
babel-template                                           insert-module-globals        relateurl
babel-traverse                                           interpret                    remove-trailing-separator
babel-types                                              invariant                    renderkid
babylon                                                  invert-kv                    repeat-element
balanced-match                                           ipaddr.js                    repeating
base64-js                                                is-absolute-url              repeat-string
base-x                                                   isarray                      request
batch                                                    is-arrayish                  require-directory
bcrypt-pbkdf                                             is-binary-path               require-from-string
big.js                                                   is-buffer                    require-main-filename
bignumber.js                                             is-builtin-module            requires-port
binary-extensions                                        is-callable                  require-uncached
bindings                                                 is-ci                        resolve
bip39                                                    is-date-object               resolve-from
bip66                                                    is-directory                 restore-cursor
block-stream                                             is-dotfile                   resumer
bluebird                                                 is-equal-shallow             right-align
bn.js                                                    isexe                        rimraf
body-parser                                              is-extendable                ripemd160
boolbase                                                 is-extglob                   rlp
boom                                                     is-finite                    run-async
brace-expansion                                          is-fullwidth-code-point      rustbn.js
braces                                                   is-function                  rx-lite
brorand                                                  is-glob                      safe-buffer
browserify                                               is-hex-prefixed              sane
browserify-aes                                           is-my-ip-valid               sass-graph
browserify-cipher                                        is-my-json-valid             sax
browserify-des                                           is-number                    scrypt
browserify-rsa                                           isobject                     scrypt.js
browserify-sha3                                          isomorphic-fetch             scryptsy
browserify-sign                                          is-path-cwd                  scss-tokenizer
browserify-zlib                                          is-path-in-cwd               secp256k1
browser-pack                                             is-path-inside               seedrandom
browser-resolve                                          is-plain-obj                 semaphore
browserslist                                             is-posix-bracket             semver
bs58                                                     is-primitive                 send
bs58check                                                is-property                  serve-index
bser                                                     is-regex                     serve-static
buffer                                                   is-resolvable                set-blocking
buffer-from                                              isstream                     setimmediate
buffer-xor                                               is-stream                    set-immediate-shim
builtin-modules                                          is-svg                       setprototypeof
builtin-status-codes                                     is-symbol                    sha3
bytes                                                    istanbul-api                 sha.js
cached-path-relative                                     istanbul-lib-coverage        shasum
caller-path                                              istanbul-lib-hook            shebang-regex
callsites                                                istanbul-lib-instrument      shelljs
camelcase                                                istanbul-lib-report          shell-quote
camel-case                                               istanbul-lib-source-maps     shellwords
camelcase-keys                                           istanbul-reports             sigmund
caniuse-api                                              is-typedarray                signal-exit
caniuse-db                                               is-utf8                      slash
cardinal                                                 jade                         slice-ansi
caseless                                                 jest                         sntp
case-sensitive-paths-webpack-plugin                      jest-changed-files           sockjs
center-align                                             jest-config                  sockjs-client
chai                                                     jest-diff                    solc
chalk                                                    jest-environment-jsdom       solidity-parser
checkpoint-store                                         jest-environment-node        sort-keys
chokidar                                                 jest-file-exists             source-list-map
ci-info                                                  jest-haste-map               source-map
cipher-base                                              jest-jasmine2                source-map-support
circular-json                                            jest-matchers                spawn-args
clap                                                     jest-matcher-utils           spdx-correct
clean-css                                                jest-mock                    spdx-exceptions
cli-cursor                                               jest-resolve                 spdx-expression-parse
cli-table                                                jest-resolve-dependencies    spdx-license-ids
cliui                                                    jest-runtime                 sprintf-js
cli-usage                                                jest-snapshot                sshpk
cli-width                                                jest-util                    statuses
clone                                                    js-base64                    stream-browserify
co                                                       jsbn                         stream-cache
coa                                                      jsdom                        stream-combiner2
code-point-at                                            jsesc                        stream-http
coffee-script                                            jsmin                        stream-splicer
coinstring                                               json3                        strict-uri-encode
color                                                    json5                        string_decoder
color-convert                                            jsonfile                     string.prototype.trim
colormin                                                 jsonify                      stringstream
color-name                                               json-loader                  string-width
colors                                                   jsonparse                    strip-ansi
color-string                                             jsonpointer                  strip-bom
combined-stream                                          json-schema                  strip-hex-prefix
combine-source-map                                       json-schema-traverse         strip-indent
commander                                                json-stable-stringify        strip-json-comments
commondir                                                JSONStream                   style-loader
compare-versions                                         json-stringify-safe          subarg
compressible                                             jsprim                       supports-color
compression                                              js-sha3                      svgo
concat-map                                               js-tokens                    symbol-tree
concat-stream                                            jsx-ast-utils                syntax-error
connect-history-api-fallback                             js-yaml                      table
console-browserify                                       keccak                       tapable
console-control-strings                                  keccakjs                     tape
constants-browserify                                     kind-of                      tar
contains-path                                            klaw                         temp
content-disposition                                      labeled-stream-splicer       test-exclude
content-type                                             lazy-cache                   text-table
content-type-parser                                      lcid                         throat
convert-source-map                                       level-codec                  through
cookie                                                   level-errors                 through2
cookie-signature                                         level-iterator-stream        timers-browserify
core-js                                                  levelup                      time-stamp
core-util-is                                             level-ws                     tmpl
cosmiconfig                                              levn                         to-arraybuffer
cpr                                                      lexical-scope                to-fast-properties
create-ecdh                                              loader-utils                 to-iso-string
create-hash                                              load-json-file               toposort
create-hmac                                              lodash                       tough-cookie
create-react-class                                       lodash._arraycopy            tr46
cross-spawn                                              lodash._arrayeach            trim
cryptiles                                                lodash.assign                trim-newlines
crypto-browserify                                        lodash._baseassign           trim-right
crypto-js                                                lodash._baseclone            truffle
css-color-names                                          lodash._basecopy             truffle-blockchain-utils
cssesc                                                   lodash._basefor              truffle-contract
css-loader                                               lodash._bindcallback         truffle-contract-schema
cssnano                                                  lodash.camelcase             truffle-default-builder
csso                                                     lodash.clonedeep             truffle-solidity-loader
cssom                                                    lodash.cond                  tty-browserify
css-select                                               lodash._getnative            tunnel-agent
css-selector-tokenizer                                   lodash.isarguments           tweetnacl
cssstyle                                                 lodash.isarray               type-check
css-what                                                 lodash.keys                  typedarray
currently-unhandled                                      lodash.memoize               type-detect
d                                                        lodash.merge                 type-is
damerau-levenshtein                                      lodash.pickby                ua-parser-js
dashdash                                                 lodash.toarray               uglify-js
date-now                                                 lodash.uniq                  uglify-to-browserify
debug                                                    longest                      umd
decamelize                                               loose-envify                 uniq
deep-eql                                                 loud-rejection               uniqid
deep-equal                                               lower-case                   uniqs
deep-is                                                  lru-cache                    unorm
default-require-extensions                               ltgt                         unpipe
deferred-leveldown                                       macaddress                   upper-case
defined                                                  makeerror                    url
define-properties                                        map-obj                      url-loader
del                                                      marked                       url-parse
delayed-stream                                           marked-terminal              user-home
delegates                                                math-expression-evaluator    utf8
depd                                                     md5.js                       util
deps-sort                                                media-typer                  utila
des.js                                                   memdown                      util-deprecate
destroy                                                  memory-fs                    utils-merge
detect-indent                                            memorystream                 uuid
detective                                                meow                         validate-npm-package-license
detect-port                                              merge                        vary
diff                                                     merge-descriptors            vendors
diffie-hellman                                           merkle-patricia-tree         verror
doctrine                                                 methods                      vm-browserify
domain-browser                                           micromatch                   walker
dom-converter                                            miller-rabin                 watch
domelementtype                                           mime                         watchpack
domhandler                                               mime-db                      web3
dom-serializer                                           mime-types                   web3-provider-engine
domutils                                                 min-document                 webidl-conversions
dom-walk                                                 minimalistic-assert          webpack
dotenv                                                   minimalistic-crypto-utils    webpack-core
drbg.js                                                  minimatch                    webpack-dev-middleware
duplexer                                                 minimist                     webpack-dev-server
duplexer2                                                mkdirp                       webpack-manifest-plugin
ecc-jsbn                                                 mocha                        webpack-sources
ee-first                                                 module-deps                  websocket-driver
electron-to-chromium                                     ms                           websocket-extensions
elliptic                                                 mute-stream                  whatwg-encoding
emojis-list                                              nan                          whatwg-fetch
encodeurl                                                natural-compare              whatwg-url
encoding                                                 ncname                       whet.extend
enhanced-resolve                                         negotiator                   which
entities                                                 next-tick                    which-module
errno                                                    no-case                      wide-align
error-ex                                                 node-dir                     window-size
es5-ext                                                  node-emoji                   wordwrap
es6-iterator                                             node-fetch                   worker-farm
es6-map                                                  node-gyp                     wrap-ansi
es6-set                                                  node-int64                   wrappy
es6-symbol                                               node-libs-browser            write
es6-weak-map                                             node-notifier                xhr
es-abstract                                              node-sass                    xhr2
escape-html                                              nopt                         xml-char-classes
escape-string-regexp                                     normalize-package-data       xmlhttprequest
escodegen                                                normalize-path               xml-name-validator
escope                                                   normalize-range              xtend
eslint                                                   normalize-url                y18n
eslint-config-react-app                                  npmlog                       yallist
eslint-import-resolver-node                              nth-check                    yargs
eslint-loader                                            num2fraction                 yargs-parser
eslint-module-utils                                      number-is-nan

public:
favicon.ico  index.html

scripts:
build.js  start.js  test.js

src:
App.css  App.js  App.test.js  css  fonts  index.css  index.js  utils

test:
simplestorage.js  TestSimpleStorage.sol
juicebox@juicebox:~/tmp2$
juicebox@juicebox:~/tmp2$ truffle test
Compiling ./contracts/Migrations.sol...
Compiling ./contracts/SimpleStorage.sol...
Compiling ./test/TestSimpleStorage.sol...
Compiling truffle/Assert.sol...
Compiling truffle/DeployedAddresses.sol...

Compilation warnings encountered:

truffle/Assert.sol:114:20: Warning: This declaration shadows an existing declaration.
    function equal(string A, string B, string message) constant returns (bool result) {
                   ^------^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:137:23: Warning: This declaration shadows an existing declaration.
    function notEqual(string A, string B, string message) constant returns (bool result) {
                      ^------^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:206:20: Warning: This declaration shadows an existing declaration.
    function equal(bytes32 A, bytes32 B, string message) constant returns (bool result) {
                   ^-------^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:226:23: Warning: This declaration shadows an existing declaration.
    function notEqual(bytes32 A, bytes32 B, string message) constant returns (bool result) {
                      ^-------^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:286:20: Warning: This declaration shadows an existing declaration.
    function equal(address A, address B, string message) constant returns (bool result) {
                   ^-------^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:305:23: Warning: This declaration shadows an existing declaration.
    function notEqual(address A, address B, string message) constant returns (bool result) {
                      ^-------^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:403:20: Warning: This declaration shadows an existing declaration.
    function equal(bool A, bool B, string message) constant returns (bool result) {
                   ^----^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:426:23: Warning: This declaration shadows an existing declaration.
    function notEqual(bool A, bool B, string message) constant returns (bool result) {
                      ^----^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:451:20: Warning: This declaration shadows an existing declaration.
    function equal(uint A, uint B, string message) constant returns (bool result) {
                   ^----^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:474:23: Warning: This declaration shadows an existing declaration.
    function notEqual(uint A, uint B, string message) constant returns (bool result) {
                      ^----^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:497:22: Warning: This declaration shadows an existing declaration.
    function isAbove(uint A, uint B, string message) constant returns (bool result) {
                     ^----^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:520:24: Warning: This declaration shadows an existing declaration.
    function isAtLeast(uint A, uint B, string message) constant returns (bool result) {
                       ^----^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:543:22: Warning: This declaration shadows an existing declaration.
    function isBelow(uint A, uint B, string message) constant returns (bool result) {
                     ^----^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:566:23: Warning: This declaration shadows an existing declaration.
    function isAtMost(uint A, uint B, string message) constant returns (bool result) {
                      ^----^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:635:20: Warning: This declaration shadows an existing declaration.
    function equal(int A, int B, string message) constant returns (bool result) {
                   ^---^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:658:23: Warning: This declaration shadows an existing declaration.
    function notEqual(int A, int B, string message) constant returns (bool result) {
                      ^---^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:681:22: Warning: This declaration shadows an existing declaration.
    function isAbove(int A, int B, string message) constant returns (bool result) {
                     ^---^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:704:24: Warning: This declaration shadows an existing declaration.
    function isAtLeast(int A, int B, string message) constant returns (bool result) {
                       ^---^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:727:22: Warning: This declaration shadows an existing declaration.
    function isBelow(int A, int B, string message) constant returns (bool result) {
                     ^---^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:750:23: Warning: This declaration shadows an existing declaration.
    function isAtMost(int A, int B, string message) constant returns (bool result) {
                      ^---^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:1267:27: Warning: This declaration shadows an existing declaration.
    function balanceEqual(address A, uint b, string message) constant returns (bool result) {
                          ^-------^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:1287:30: Warning: This declaration shadows an existing declaration.
    function balanceNotEqual(address A, uint b, string message) constant returns (bool result) {
                             ^-------^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:1306:28: Warning: This declaration shadows an existing declaration.
    function balanceIsZero(address A, string message) constant returns (bool result) {
                           ^-------^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^

,truffle/Assert.sol:1325:31: Warning: This declaration shadows an existing declaration.
    function balanceIsNotZero(address A, string message) constant returns (bool result) {
                              ^-------^
truffle/Assert.sol:64:5: The shadowed declaration is here:
    uint8 constant A = uint8(byte('a'));
    ^---------------------------------^




  TestSimpleStorage
    ✓ testItStoresAValue (184ms)

  Contract: SimpleStorage
    ✓ ...should store the value 89. (160ms)


  2 passing (1s)

juicebox@juicebox:~/tmp2$


```
