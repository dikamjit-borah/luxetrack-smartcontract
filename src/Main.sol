// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LuxeTrack {
    struct Item {
        uint256 itemId;
        string serialNumber; 
        string itemName;
        string brand;
        string model;
        uint256 manufacturingDate;
        address currentOwner;
        address[] ownershipHistory; // previous owners
        bool exists; //is_active flag
    }

    uint256 private nextItemId = 1; //uuid for item / item_id
    mapping(uint256 => Item) public items;
    mapping(string => bool) private serialNumberExists;

    event ItemRegistered(
        uint256 indexed itemId,
        string serialNumber,
        string itemName,
        string brand,
        string model,
        uint256 manufacturingDate,
        address indexed owner
    );


    function registerItem(
        string memory _serialNumber,
        string memory _itemName,
        string memory _brand,
        string memory _model,
        uint256 _manufacturingDate
    ) public returns (uint256) {
        require(!serialNumberExists[_serialNumber], "Item already registered!");

        uint256 itemId = nextItemId;
        nextItemId++;
        address[] memory _ownershipHistory;

        items[itemId] = Item({
            itemId: itemId,
            serialNumber: _serialNumber,
            itemName: _itemName,
            brand: _brand,
            model: _model,
            manufacturingDate: _manufacturingDate,
            currentOwner: msg.sender,
            ownershipHistory: _ownershipHistory, // Initialize empty history
            exists: true
        });

        serialNumberExists[_serialNumber] = true;

        emit ItemRegistered(itemId, _serialNumber, _itemName, _brand, _model, _manufacturingDate, msg.sender);

        return itemId;
    }


}
