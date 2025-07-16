// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SoulboundToken is ERC721 {
    uint256 private _tokenIdCounter;
    mapping(uint256 => string) private _skills;

    constructor() ERC721("SoulboundToken", "SBT") {}

    function mint(address to, string memory skillName) public {
        uint256 tokenId = _tokenIdCounter;
        _safeMint(to, tokenId);
        _skills[tokenId] = skillName;
        _tokenIdCounter++;
    }

    function getSkill(uint256 tokenId) public view returns (string memory) {
        require(_ownerOf(tokenId) != address(0), "SoulboundToken: query for nonexistent token");
        return _skills[tokenId];
    }

    // Only override the virtual safeTransferFrom, approve, and setApprovalForAll
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public pure override {
        revert("SoulboundToken: token is non-transferable");
    }

    function approve(address to, uint256 tokenId) public pure override {
        revert("SoulboundToken: token is non-transferable");
    }

    function setApprovalForAll(address operator, bool approved) public pure override {
        revert("SoulboundToken: token is non-transferable");
    }
} 