import { LightningElement ,wire } from 'lwc';
import fetchTaskBySubject from '@salesforce/apex/TaskController.fetchTaskBySubject';

export default class SearchTaskBySubjectName extends LightningElement {
    searchKey= 'call';
  taskList;
  errorMessage;
    @wire(fetchTaskBySubject, { subjectString: '$searchKey' })
    wiredTasks({ data, error }){
        if(data){
            this.taskList = data;
            this.errorMessage = undefined;
        }
        else if(error){
            this.errorMessage = error.body.message;
            this.taskList = undefined;
        }
    }
}