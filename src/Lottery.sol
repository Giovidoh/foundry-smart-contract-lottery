// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.19;

/**
 * @title Lottery Contract
 * @author ICGreborns
 * @notice This is a lottery contract that allows anybody to join and maybe be chosen.
 * @dev Implements Chainlink VRFv2.5
 */
contract Lottery {
    /* Errors */
    error Lottery__SendMoreToEnterLottery();

    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    /* Events */
    event LotteryEntered(address indexed player);

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterLottery() public payable {
        if (msg.value < i_entranceFee) {
            revert Lottery__SendMoreToEnterLottery();
        }
        s_players.push(payable(msg.sender));
        emit LotteryEntered(msg.sender);
    }

    function pickWinner() public {}

    /* Getter Functions */
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
