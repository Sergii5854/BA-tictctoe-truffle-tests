

const TicTacToe = artifacts.require("TicTacToe");
contract("TicTacToe", accounts => {
    it("should put 54 coin in the first account", () =>
        TicTacToe.deployed()
            .then(instance => instance.getBalance.call(accounts[0]))
            .then(balance => {
                assert.equal(
                    balance.valueOf(),
                    54000,
                    "10000 wasn't in the first account"
                );
            }));

})