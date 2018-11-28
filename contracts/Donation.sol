pragma solidity ^0.4.17;

contract Donation{
    address[16] public donators;

    //Donating
    function donate(uint certificate) public returns (uint) {
        require(certificate >= 0 && certificate <= 15);

        donators[certificate] = msg.sender;

        return certificate;
    }

    // Retrieving the donators
    function getDonators() public view returns(address[16]){
        return donators;
    }
}
