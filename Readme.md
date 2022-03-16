# Hardhat vs Foundry

This repository contains two similar projects built with Hardhat and Foundry, which have been used to support an article published in [Chainstack's blog](https://chainstack.com/blog/).

## Differences

|                                                          | Foundry                                                                                     | Hardhat                                                                             |
| -------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- | --- | --- |
| Installation                                             | via CLI curl command                                                                        | not required with NPX, or via NPM                                                   |
| CLI tools                                                | **forge** to manage the project (build/compile) & **cast** to interact with smart contracts | **hardhat** manage the project (build/compile/run scripts)                          |
| Build & test performance                                 | 💨💨💨💨💨                                                                                  | 🐢🐢                                                                                |
| Configuration file                                       | `foundry.toml`                                                                              | `hardhat.config.js`                                                                 |
| Allows project folder configuration                      | Yes, in `foundry.toml` file                                                                 | Yes, in `hardhat.config.js` file                                                    |
| Dependency management                                    | GitHub submodules (any repository)                                                          | NPM packages                                                                        |
| Dependencies file                                        | .gitmodules                                                                                 | package.json                                                                        |     |     |
| Files included in sample project                         | empty smart contract and basic test                                                         | Greeter smart contract (with set/get methods), test files and script to run locally |
| Test file format                                         | Solidity contracts                                                                          | JavaScript test files                                                               |
| Test assertion library (default)                         | ds-test                                                                                     | Mocha                                                                               |
| Allows to alter blockchain status (time, block) in tests | Yes via cheatcodes                                                                          | Limited, via mainnet forking.                                                       |
| Allows run specific tests?                               | Yes via --match-test --match-contract                                                       | Yes via "only" or "skip" in test files                                              |
| Contract deployments                                     | Via forge CLI or Bash scripts (new solutions in progress)                                   | Via JS scripts                                                                      |
| Blockchain / contracts interaction                       | via Cast CLI tool                                                                           | N/A                                                                                 |

## Project structure vs Hardhat

| Files          | Foundry   | Hardhat       |
| -------------- | --------- | ------------- |
| Contract files | /src      | /contracts    |
| Test files     | /src/test | /test         |
| Output         | /out      | /artifacts    |
| Dependencies   | /lib      | /node_modules |

## Testing with Foundry

| Pros                      | Cons                                                                        | Neither                  |
| ------------------------- | --------------------------------------------------------------------------- | ------------------------ |
| No async/await            | Test names not as descriptive as in JS tests                                | tests writen in solidity |
| Tests require less code   | Cheats are difficult to understand at first                                 |
| Tests run super fast      | `expectRevert` assertion is weird                                           |
| Auto-generated gas report | `testFail` only tests if the test fails, not if the error is what we expect |
