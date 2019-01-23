const TicTacToe = artifacts.require("./TicTacToe");


contract(" TicTacToe test", async accounts => {
    var instance;
    var player1 = accounts[0]
    var player2 = accounts[1]

    beforeEach(" instance ", async () => {
        instance = await TicTacToe.new();

        instance.setUser({from: player1 })
        instance.setUser({from: player2 })
        assert.equal( await instance.player1(), player1);
        assert.equal( await instance.player2(), player2);
        assert.equal( await instance.activeUser(), player2);
        // await instance.drow(0,0 , {from:player2})
        console.log('getCell',(await instance.getCell(0, 0)).toNumber());


        instance.drow( 0,0 , {from:player2 })
        instance.drow( 1,0 , {from:player1 })
        instance.drow( 0,1 , {from:player2 })
        instance.drow( 1,1 , {from:player1 })
        instance.drow( 0,2 , {from:player2 })
        console.log('getCell 0 0 ___ ',(await instance.getCell(0, 0)).toNumber());
        console.log('getCell 0 1 ___ ',(await instance.getCell(0, 1)).toNumber());
        console.log('getCell 0 2 ___',(await instance.getCell(0, 2)).toNumber());
        console.log( "1111111111", ( await instance.gameWinner() ).toNumber() ) ;

    });
    //
    // it("check init variables ", async () => {
    //     assert.equal( await instance.isReady(), true);
    //     // assert.equal( await instance.stepCounter.call(), 0);
    //     assert.equal( await instance.activeUser(), '0x0000000000000000000000000000000000000000');
    //     assert.equal( await instance.player1(),  '0x0000000000000000000000000000000000000000');
    //     assert.equal( await instance.player2(),  '0x0000000000000000000000000000000000000000');
    // });

    it("check scenario  TicTacToe Game ", async () => {
        // assert.equal( await instance.player2(),  '0x0000000000000000000000000000000000000000');
    });

})