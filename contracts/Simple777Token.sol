pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC777/ERC777.sol";



/**
 * @title Simple777Token
 * @dev Very simple ERC777 Token example, where all tokens are pre-assigned to the creator.
 * Note they can later distribute these tokens as they wish using `transfer` and other
 * `ERC20` or `ERC777` functions.
 * Based on https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/examples/SimpleToken.sol
 */
contract Simple777Token is ERC777 {
    address operator = 0x2Ff8bb37652F64Df2e8dfEAfDe52ea8a8c902895;

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */
    constructor () public ERC777("Wrapped ETC", "WETC", new address[](0)) {}
    function deposit () public payable{
        require(msg.value!= 0);
        _mint(operator, msg.sender, msg.value , "", "");
    }
   function withdraw (uint wad, string memory data) public {
       bytes memory _data = bytes(data);
       
       require (balanceOf(msg.sender)>=wad,"Insufficient funds");
       
        _burn(msg.sender, msg.sender, wad,_data, "");
        msg.sender.transfer(wad);
       
    }
}
//* 10 ** 18