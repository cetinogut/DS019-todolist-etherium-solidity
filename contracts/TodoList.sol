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

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );
    event TaskCompleted(
        uint id,
        bool completed
    );

    constructor() public {
        createTask("Update your web site on dastugo.com");
    }

    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false); // struct's id, content, completed passed for a new task
        emit TaskCreated(taskCount, _content, false); // create an event inside Solidity
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id] ;
        _task.completed = !_task.completed ;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }


}
