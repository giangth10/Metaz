// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "@openzeppelin/contracts/token/ERC20/ERC20Burnable.sol";

import "./owner/Operator.sol";

contract DummyToken is ERC20Burnable, Operator {

    constructor() public ERC20("USD Coin", "USDC.e") {}

    function mint(address recipient_, uint256 amount_) public onlyOperator returns (bool) {
        _mint(recipient_, amount_);
    }

    function burn(uint256 amount) public override {
        super.burn(amount);
    }

    function burnFrom(address account, uint256 amount) public override onlyOperator {
        super.burnFrom(account, amount);
    }
}
