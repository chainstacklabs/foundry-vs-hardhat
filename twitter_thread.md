If you're learning solidity and web3, you're probably following tutorials using Remix, Hardhat or Truffle. They're the most common solidity dev tools but, have you heard about Foundry? If not, keep reading because it's worth checking it out 👇

Foundry was created by Paradigm, the company behind many successful blockchain projects and they've recently released version 0.2.0

https://twitter.com/gakonst/status/1509189773855891459

Foundry is a new solidity toolkit written in Rust and it is fast. To test how much, I compiled the same solidity project (26 contracts). With Hardhat, it took 14.56 seconds and with Foundry, it took 8.53 seconds 💨

The main difference with Hardhat is that in Foundry, tests are written in Solidity. This is plus cause tests require less code and you can keep all your ethereum codebase in a single language.

In addition, this makes running tests way faster. I created a simple project and tested the same scenarios in Hardhat and Foundry. With Hardhat, tests took 5.17secs and with Foundry just 1.44seconds

Deployments are still a little tricky and are done via CLI or bash scripts. The team is working on a better solution but the community is already creating good alternatives, like these scripts by @PatrickAlphaC

https://github.com/smartcontractkit/foundry-starter-kit/tree/main/scripts

Talking about community, it's growing fast. The repo has more than 2K ⭐️ in Github and if you need any help you can ask in one of their official Telegram channels:

General (600+ members): https://t.me/foundry_rs
Support (300+ members): https://t.me/foundry_support

If you want to learn more about Foundry, check out the article below in which I detailed how it compares in performace and developer experience vs Hardhat 👇

https://chainstack.com/foundry-hardhat-differences-performance/

And if you are already dediced to give it a try, you can find more info about how to install it and how to create your first project in the Foundry Book 👇

https://book.getfoundry.sh/getting-started/installation.html
