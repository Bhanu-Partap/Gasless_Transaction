// contracts/Counter.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

// import "https://github.com/frankenstien-831/openzeppelin-contracts-ethereum-package/blob/master/contracts/GSN/GSNRecipient.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/GSN/GSNRecipient.sol";   

contract Counter is GSNRecipientUpgradeSafe {
    uint256 public value;

    function increase() public {
        value += 1;
    }

    function acceptRelayedCall(
        address relay,
        address from,
        bytes calldata encodedFunction,
        uint256 transactionFee,
        uint256 gasPrice,
        uint256 gasLimit,
        uint256 nonce,
        bytes calldata approvalData,
        uint256 maxPossibleCharge
    ) external  view  override returns (uint256, bytes memory) {
        return _approveRelayedCall();
    }

    // We won't do any pre or post processing, so leave _preRelayedCall and _postRelayedCall empty
    function _preRelayedCall(bytes memory context) internal override returns (bytes32) {
    }

    function _postRelayedCall(bytes memory context, bool, uint256 actualCharge, bytes32) internal override{
    }
}

