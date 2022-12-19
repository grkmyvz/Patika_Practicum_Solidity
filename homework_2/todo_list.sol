// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {

    struct Todo {
        string text;
        bool completed;
    }

     Todo[] public todos;

     function create(string calldata _text) external {
         todos.push(Todo({text: _text, completed: false})); // The todo struct data is written into the todos list with its parameters.
     }

     function updateText(uint256 _index, string calldata _text) external {
         todos[_index].text = _text; // Updating the text data of the struct in todos.

         //Todo storage todo = todos[_index];
         //todo.text = _text;
     }

     function get(uint256 _index) external view returns(string memory, bool) {
         Todo memory todo = todos[_index]; // The struct parameters in the index given in todos are retrieved.
         return(todo.text, todo.completed); // These parameters are returned with return.
     }

     function toggleComplete(uint256 _index) external {
         todos[_index].completed = !todos[_index].completed; // It changes the competed variable in todos.
     }

}