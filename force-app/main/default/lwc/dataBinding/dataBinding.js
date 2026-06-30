import { LightningElement } from 'lwc';

export default class DataBinding extends LightningElement {
    name = 'John Doe';
    currentTime = new Date();
    subscriber= 9;

    memberStatus;
  
    updatememberStatus(event){
        this.memberStatus = event.target.value;
    }

    _minutesWatched = (this.subscriber*3);

    get minutesWatched(){
    return this._minutesWatched;
    }

    set minutesWatched(value){
   this._minutesWatched= value < 1000 ? value :5000;
    }

    handleWatchChange(event){
        this.minutesWatched = event.target.value;
    }
}