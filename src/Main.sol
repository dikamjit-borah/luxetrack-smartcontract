// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Notes {
    struct Note {
        string title;
        string description;
    }
    // Each address has their own notebook
    mapping(address => Note[]) private notebooks;

    // log notes
    event NoteAdded(address indexed user, string title, string description);

    function addToNotebook(
        string memory title,
        string memory description
    ) public {
        notebooks[msg.sender].push(Note(title, description));
        emit NoteAdded(msg.sender, title, description);
    }

    function getMyNotes() public view returns (Note[] memory) {
        return notebooks[msg.sender]; // Only returns the sender’s notes
    }
}
