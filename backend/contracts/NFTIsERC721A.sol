// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

/* Author : Ben BK */

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import './ERC721A.sol';

contract NFTIsERC721A is ERC721A, Ownable {

    using Strings for uint;

    uint private constant MAX_SUPPLY = 10;
    uint private constant PRICE_WHITELIST_MINT = 0.002 ether;
    uint private constant MAX_PER_ADDRESS_DURING_WHITELIST_MINT = 2;

    bytes32 public merkleRoot;

    string public baseURI;

    mapping(address => uint) amountNFTperWalletWhitelistSale;

    constructor(bytes32 _merkleRoot, string memory _baseURI) 
    ERC721A("NFT Alyra", "NFTAlyra")
    Ownable(msg.sender) {
        merkleRoot = _merkleRoot;
        baseURI = _baseURI;
    }

    /**
    * @notice Mint function for the Whitelist Sale
    *
    * @param _account Account which will receive the NFT
    * @param _quantity Amount of NFTs the user wants to mint
    * @param _proof The merkle proof
    **/
    function whitelistMint(address _account, uint _quantity, bytes32[] calldata _proof) external payable {
        //!\ A COMPLETER /!\
        require(amountNFTperWalletWhitelistSale[msg.sender] + _quantity <= MAX_PER_ADDRESS_DURING_WHITELIST_MINT, "You can only mint two NFTs during the Whitelist Sale");
        require(totalSupply() + _quantity <= MAX_SUPPLY, "Max supply exceeded");
        require(msg.value >= PRICE_WHITELIST_MINT * _quantity, "Not enought funds");
        amountNFTperWalletWhitelistSale[msg.sender] += _quantity;
        _safeMint(_account, _quantity);
    }

    /**
    * @notice Get the token URI of a NFT by his ID
    *
    * @param _tokenId The Id of the NFT you want to have the URI of the metadatas
    *
    * @return URI of an NFT by his ID
    */
    function tokenURI(uint _tokenId) public view virtual override(ERC721A) returns(string memory) {
        require(_exists(_tokenId), "URI query for nonexistent token");

        return string(abi.encodePacked(baseURI, _tokenId.toString(), ".json"));
    }

    /**
    * @notice Change the base URI of the NFTs
    *
    * @param _baseURI the new base URI of the NFTs
    **/
    function setBaseURI(string memory _baseURI) external onlyOwner {
        baseURI = _baseURI;
    }

    /**
    * @notice Change the merkle root
    *
    * @param _merkleRoot the new merkle root
    **/
    function setMerkleRoot(bytes32 _merkleRoot) external onlyOwner {
        merkleRoot = _merkleRoot;
    }

    /**
    * @notice Check if an address is whitelisted or not
    * 
    * @param _account The account checked
    * @param _proof The merkle proof
    *
    * @return bool return true if the address is whitelisted, false otherwise
    **/
    function isWhitelisted(address _account, bytes32[] calldata _proof) internal view returns(bool) {
        //!\ A COMPLETER /!\
    }
}