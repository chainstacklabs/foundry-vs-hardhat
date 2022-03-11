# Hardhat vs Foundry

This repository contains two different projects built with Hardhat and Foundry.

## Differences

|                                     | Foundry                                                                                     | Hardhat                                                                             |
| ----------------------------------- | ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| Installation                        | via CLI curl command                                                                        | via NPM or not required with NPX                                                    |
| CLI tools                           | **forge** to manage the project (build/compile) & **cast** to interact with smart contracts | **hardhat** manage the project (build/compile)                                      |
| Configuration file                  | foundry.toml                                                                                | hardhat.config.js                                                                   |
| Allows project folder configuration | Yes, in foundry.toml file                                                                   | Yes, in hardhat.config.js file                                                      |
| Dependency management               | GitHub submodules (any repository)                                                          | NPM packages                                                                        |
| Dependency configuration            | remappings allowed in foundry.toml or remappings.txt file                                   | N/A                                                                                 |
| Files included in sample project    | empty smart contract and basic test                                                         | Greeter smart contract (with set/get methods), test files and script to run locally |
| Test files                          | Solidity contracts                                                                          | JavaScript test files                                                               |
| Test assertion library (default)    | ds-test                                                                                     | Mocha                                                                               |
| Allows run specific tests?          | Yes via --match-test --match-contract                                                       | Yes via "only" or "skip" in test files                                              |

## Testing with Foundry

| Pros                      | Cons                                                                        | Neither                  |
| ------------------------- | --------------------------------------------------------------------------- | ------------------------ |
| No async/await            | Test names not as descriptive as in JS tests                                | tests writen in solidity |
| Tests require less code   | Cheats are difficult to understand at first                                 |
| Tests run super fast      | `expectRevert` assertion is weird                                           |
| Auto-generated gas report | `testFail` only tests if the test fails, not if the error is what we expect |
