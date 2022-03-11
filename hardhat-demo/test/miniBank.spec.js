const { expect } = require('chai')
const { ethers } = require('hardhat')

let miniBankFactory, miniBankContract, owner, user1, user2, user3

describe('MinBank contract', function () {
  beforeEach(async function () {
    miniBankFactory = await ethers.getContractFactory('MiniBank')
    ;[owner, user1, user2, user3] = await ethers.getSigners()
    miniBankContract = await miniBankFactory.deploy()
    await miniBankContract.deployed()
  })

  it('Should return the number of opened accounts', async function () {
    expect(await miniBankContract.accountsOpened()).to.equal(0)
  })
  it('Should allow new users to open an account', async function () {
    await miniBankContract.connect(user1).openAccount()
    expect(await miniBankContract.accountsOpened()).to.equal(1)
  })
  it('Should allow multiple users to open accounts', async function () {
    await miniBankContract.connect(user1).openAccount()
    await miniBankContract.connect(user2).openAccount()
    await miniBankContract.connect(user3).openAccount()

    expect(await miniBankContract.accountsOpened()).to.equal(3)
  })

  it('Should prevent users to open a second account', async function () {
    await miniBankContract.connect(user1).openAccount()

    await expect(
      miniBankContract.connect(user1).openAccount()
    ).to.be.revertedWith('MiniBank: User has an account already!')
  })
  it('Should allow users to deposit ETH', async () => {
    await miniBankContract.connect(user1).openAccount()

    await miniBankContract.connect(user1).deposit({ value: 1 })
    expect(await miniBankContract.connect(user1).checkBalance()).to.equal(1)
  })

  it('Should allow users to close the account and update accounts counter', async () => {
    await miniBankContract.connect(user1).openAccount()
    await miniBankContract.connect(user2).openAccount()

    expect(await miniBankContract.accountsOpened()).to.equal(2)
    await miniBankContract.connect(user1).closeAccount()
    expect(await miniBankContract.accountsOpened()).to.equal(1)
  })

  it('Should return error if user tries to withdraw without open acc first', async function () {
    await expect(miniBankContract.withdraw(1)).to.be.revertedWith(
      'MiniBank: User does not have an account'
    )
  })
})
