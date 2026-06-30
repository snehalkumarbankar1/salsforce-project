import { LightningElement,track,api } from 'lwc';
import uploadFileToAccount from '@salesforce/apex/FileUploaderController.uploadFileToAccount';

export default class FileUploaderRename extends LightningElement {

      originalFileName;
      renamedFileName;
      fileSize;
      fileType;
      @ track fileContent;
      fileSelected = false;
      @api recordId;
      error;
      isLoading = false;
      uploadStatus;

    handleFileChange(event){
    const file = event.detail.files[0];
if(file){

    this.fileSelected = true;
    this.originalFileName = file.name;
    this.renamedFileName = file.name;
    this.fileSize  = (file.size/1024).toFixed(2);
    this.fileType = file.type;

    const reader = new FileReader();

    reader.onload = ()=> {
        this.fileContent= reader.result.split(',')[1];
    }
      reader.readAsDataURL(file);
}

    }
    handleRename(event){
        this.renamedFileName = event.detail.value;
    }
    handleUpload(){
        this.resetMessage();
        this.isLoading=true;
        uploadFileToAccount({
          fileName : this.renamedFileName,
          base64Data : this.fileContent,
          contentType : this.fileType,
          accountId : this.recordId
        })
        .then(()=>{
            this.uploadStatus = 'File uploaded to Account successfully';
           this.fileSelected = false;
        })
        .catch(e =>{
            this.error = e; 
        })
        .finally(()=>{
            this.isLoading=false; 
        })
    }
    resetMessage(){
     this.uploadStatus = '';
     this.error = '';
    }
}