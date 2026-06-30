import { LightningElement,wire } from 'lwc';
import fetchTaskBySub from '@salesforce/apex/TaskController.fetchTaskBySub';

export default class SearchTaskBySubjectImperative extends LightningElement {
    subject;
    taskList;
    errorMessage;
    showTask = false;
    handleSubjectChange(event){
        
        this.subject = event.target.value;
    }
    searchTasks() {
      fetchTaskBySub({subjectString:this.subject})
      .then(result =>{
        this.taskList = result;
        this.showTask = true;
        this.errorMessage = undefined;
      })
      .catch(error => {
        this.errorMessage = error.body.message;})
         this.taskList = undefined;
          
        }
        
      }