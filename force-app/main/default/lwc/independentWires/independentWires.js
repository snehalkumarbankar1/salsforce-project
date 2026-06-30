import { LightningElement ,wire } from 'lwc';
import fetchCases from '@salesforce/apex/IndependentWireController.fetchCases';
import fetchTasks from '@salesforce/apex/IndependentWireController.fetchTasks';

export default class IndependentWires extends LightningElement {
    caseList;
    taskList;
    showCases= false;
    showTasks = false;
    errorMessage;

    @wire(fetchCases)
    wiredCases({data,error}){
        if(data){
            this.caseList = data;
            this.showCases = true;
            this.errorMessage = undefined;
        }
        else if(error){
        this.errorMessage = error.body.message;
         this.caseList = undefined;
        }
    }

    @wire(fetchTasks)
    wiredTasks({data,error}){
        if(data){
            this.taskList = data;
            this.showTasks = true;
            this.errorMessage = undefined;
        }
        else if(error){
        this.errorMessage = error.body.message;
        this.taskList = undefined;
        }
    }
}