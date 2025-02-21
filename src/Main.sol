// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Notes {
    struct Note {
        string title;
        string description;
    }

    Note[] public notebook;

    function addToNotebook(string memory title, string memory description) public {
        notebook.push(Note(title, description)); 
    }

    function getNotes() public view returns (Note[] memory) {
        return notebook;
    }
}
