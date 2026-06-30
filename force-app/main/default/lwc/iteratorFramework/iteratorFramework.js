import { LightningElement } from 'lwc';

export default class IteratorFramework extends LightningElement {

    taskList = [
        {
           id : 1,  
            name: 'Task 1',
            status: 'In Progress'
        },
        {
            id : 2,
            name: 'Task 2',
            status: 'pending'
        },
        {
            id : 3,
            name: 'Task 3',
            status: 'completed'
        }
    ];
}