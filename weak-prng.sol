// SPDX-License-Identifier: GPL-3.0 
pragma solidity ^0.8.24;

contract Game {

    uint reward_determining_number;

    function guessing() external{
      //rule-id: weak-prng
      reward_determining_number = uint256(blockhash(10000)) % 10;
    }
}

contract Game1 {

    uint reward_determining_number;

    function guessing() external{
      //rule-id: weak-prng
      reward_determining_number = uint256(block.timestamp) % 10;
    }
}

contract Game2 {

    uint reward_determining_number;

    function guessing() external{
      //rule-id: weak-prng
      reward_determining_number = uint256(block.timestamp) % 10;
    }
}
 
contract InsecureRandomNumber {
    constructor() payable {}
 
    function guess(uint256 _guess) public {
        //rule-id: weak-prng
        uint256 answer = uint256(
            keccak256(
                abi.encodePacked(block.timestamp, block.difficulty, msg.sender) // Using insecure mechanisms for random number generation
            )
        );
 
        if (_guess == answer) {
            (bool sent,) = msg.sender.call{value: 1 ether}("");
            require(sent, "Failed to send Ether");
        }
    }
}