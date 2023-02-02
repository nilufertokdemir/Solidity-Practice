// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;


contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external{
        todos.push(Todo({text : _text,completed : false}));
    }

    function updateText(uint _index, string calldata _text) external{
        //if you have one process it is cheaper
        todos[_index].text = _text;

        //if you have multiple process it is cheaper
        Todo storage todo = todos[_index];
        todo.text = _text;
    }
    
    function get(uint _index) external view returns(string memory, bool){
        Todo storage todo = todos[_index]; //memory is slightly more expensible
        return (todo.text, todo.completed);
    }

    function toogleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }

}