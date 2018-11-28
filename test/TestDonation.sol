pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Donation.sol";

contract TestDonation{

    Donation donation = Donation(DeployedAddresses.Donation());

    uint expectedCertificate = 8;

    address expectedDonator = this;

    function testUserCanDonate() public {

        uint returnedId = donation.donate(expectedCertificate);

        Assert.equal(returnedId, expectedCertificate, "Donation of the expected donation should match what is trturbed.");
    }

    function testGetDonatorAddressByCertificate() public {
        address donators = donation.donators(expectedCertificate);

        Assert.equal(donators, expectedDonator, "Owner of the expected certificate should be this contract");
    }

    function testDonatorAddressByCertificateArray() public{
        address[16] memory donators = donation.getDonators();

        Assert.equal(donators[expectedCertificate], expectedDonator, "Owner of the expected certificate should be this contract");
    }
}
