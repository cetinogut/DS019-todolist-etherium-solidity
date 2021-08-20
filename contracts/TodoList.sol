pragma solidity ^0.5.0;

contract TodoList{
    uint public taskCount = 0; 
    //state variable is written to the blockchain

    struct Task {       // data structure that will hold the tasks
        uint id;
        string content;
        bool completed;
    }    

    mapping(uint => Task) public tasks; // kind like a database on blockchain

    constructor() public {
        createTask("Update your web site on dastugo.com");
    }

    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false); // struct's id, content, completed passed for a new task
    }


}
