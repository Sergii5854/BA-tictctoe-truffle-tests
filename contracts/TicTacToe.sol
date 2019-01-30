pragma solidity 0.5.0;


contract TicTacToe
{
    uint8 stepCounter;
    bool public  isReady;
    address public activeUser;
    address public player1; // 1 = o
    address public player2; // 2 = x
    uint8[][] public board;
    uint8 public gameWinner = 0;

    constructor() public {
        isReady = true;
        stepCounter = 0;
        initArray();
    }

    modifier onlyActiveUser() {
        require(msg.sender == activeUser);
        _;
    }

    function initArray() internal {
        board = new uint8[][](3);
        for (uint8 i = 0; i < 3; i++) {
            uint8[] memory temp = new uint8[](3);
            for (uint8 j = 0; j < 3; j++) {
                temp[j] = 0;
            }
            board[i] = temp;
        }
    }

    function setUser() public {

        require(
            player1 == address(0) ||
            player2 == address(0)
        );

        if (player1 == address(0)) {
            player1 = msg.sender;
        } else if (player2 == address(0)) {
            player2 = msg.sender;
            activeUser = player2;
            isReady = false;
            uint8 counter = 3;
            for (uint8 i = 0; i < 3; i++) {
                for (uint8 j = 0; j < 3; j++) {
                    board[i][j] = counter;
                    counter++;
                }
            }
        }

    }

    function drow(uint8 col, uint8 row) onlyActiveUser public {
        require(row < 3 && col < 3);
        require( board[col][row] != 1 && board[col][row] != 2 );

        stepCounter = stepCounter + 1;

        if (msg.sender == player1) {
            board[col][row] = 1;
            activeUser = player2;

        } else if (msg.sender == player2) {
            board[col][row] = 2;
            activeUser = player1;
        }

        checkWinner();

        if (!checkBoard()) {
            reset();
        }

    }

    function reset() internal {
        player1 = address(0);
        player2 = address(0);
        isReady = true;
        stepCounter = 0;

    }

    function checkWinner() internal {

        //[(0,0),(0,1),(0,2)]
        //[(1,0),(1,1),(1,2)]
        //[(2,0),(2,1),(2,2)]


        if (
            board[1][1] == board[0][1] && board[1][1] == board[2][1] || // center-v
            board[1][1] == board[0][0] && board[1][1] == board[2][2] || // back-slash
            board[1][1] == board[0][2] && board[1][1] == board[2][0] || // slash
            board[1][1] == board[1][0] && board[1][1] == board[1][2])   // center-h
        {
            gameWinner = board[1][1];
            reset();
        } else if (
            board[0][1] == board[0][0] && board[0][1] == board[0][2] || //
            board[1][0] == board[0][0] && board[1][0] == board[2][0]
        ) {
            gameWinner = board[0][0];
            reset();
        } else if (
            board[2][1] == board[2][0] && board[2][1] == board[2][2] ||
            board[1][2] == board[0][2] && board[1][2] == board[2][2])
        {
            gameWinner = board[2][2];
            reset();
        } else {
            gameWinner = 0;

        }


    }

    function checkBoard() internal view returns (bool){

        for (uint8 i = 0; i < 2; i++) {
            for (uint8 j = 0; j < 2; j++) {

                if (board[i][j] >  2 ) {
                    return true;
                }

            }
        }

        return false;
    }

    function getCell(uint8 col, uint8 row) public view returns (uint8){

        return board[col][row];
    }

}