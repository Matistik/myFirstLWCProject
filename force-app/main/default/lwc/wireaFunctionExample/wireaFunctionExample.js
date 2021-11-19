import { LightningElement,wire,api,track } from 'lwc';
import findMyOffers from '@salesforce/apex/getAccountRecord.getAccountRecordMethod';
import getSingleAccount from '@salesforce/apex/getAccountName.getSingleAccount';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import { getSObjectValue } from '@salesforce/apex';
import { getRecord } from 'lightning/uiRecordApi';




export default class wireaFunctionExample extends NavigationMixin(
    LightningElement
) {

    

    

    @api recordId;
 
     @track accountRecord;

     @track accountName;
 
     @track error;

     @track enteredText = '';

     @track openModal = false;

     @track openModalOpp = false;

     @track searchTerm;

     
 
     
     
     



    accountObject = ACCOUNT_OBJECT;
    myFields = [NAME_FIELD, WEBSITE_FIELD];

 

@wire(getSingleAccount) contact;

    get name() {
        console.log('asdasdas ' + this.contact.data ? getSObjectValue(this.contact.data, NAME_FIELD) : '');
        return this.contact.data ? getSObjectValue(this.contact.data, NAME_FIELD) : '';
    }

    

    

    navigateToNewContactWithDefaults() {

        //let name = target.name;
        //console.log('name ' + name);

        var date = new Date();
        date.setDate(date.getDate() + 30);
        var dateString = date.toISOString().split('T')[0];

        

        



        
            console.log('loggg  ' + this.accountName);
        const defaultValues = encodeDefaultFieldValues({
            Name: 'asd',
            Amount: 1000,
            CloseDate: dateString,
            StageName: 'Prospecting',
            LeadSource: 'offer'


            
    });

        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Opportunity',
                actionName: 'new'
            },
            state: {
                defaultFieldValues: defaultValues
            }
        });
    }

    

   

    handleAccountCreated(){
        // Run code when account is created.
    }



     
 
    @wire(findMyOffers,{ recordIdAccount: '$recordId'}) 
   
    accountsData({ error, data }) {

         if (data) {
        
            this.accountRecord = data;

            console.log('data ' + data.Name);

            this.error = undefined;

        } else if (error) {

            this.error = error;

            this.accountRecord = undefined;

       }

       

}



handleNavigateTo(event) {
event.preventDefault();

let id = event.target.id;
let newId = id.slice(0, id.length - 4);



    window.location.assign("https://parallaxis36-dev-ed.lightning.force.com/lightning/r/Account/"+newId+"/view");
    
    
}

handleNavigateTo2(event) {
    event.preventDefault();
    
    let id = event.target.id;
    let newId = id.slice(0, id.length - 4);

    this[NavigationMixin.Navigate]({
    type: 'standard__objectPage',
    attributes: {
        objectApiName: 'Opportunity',
        actionName: 'new'
    }
});
    
       // window.location.assign("https://parallaxis36-dev-ed.lightning.force.com/lightning/o/Opportunity/new?count=1&nooverride=1&useRecordTypeCheck=1&navigationLocation=RELATED_LIST&uid=163671353799921874&backgroundContext=%2Flightning%2Fr%2FAccount%2F"+newId+"%2Fview");
        
    }

    handleSuccess (){
        const evt = new ShowToastEvent({
            title: "Success!",
            message: "The Contact's record has been successfully saved.",
            variant: "success",
        });
        this.dispatchEvent(evt);
    }

    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
        const selectedEvent = new CustomEvent('newsearch', {detail: this.searchTerm});
        this.dispatchEvent(selectedEvent);
    }




handleComment(event){

    console.log(this.searchTerm);

}
showModal() {
    this.openModal = true;
    }
closeModal() {
    this.openModal = false;
}

saveModal(){

  this.openModal = false;
}

showModalOpp() {
    this.openModalOpp = true;
    }
closeModalOpp() {
    this.openModalOpp = false;
}

saveModalOpp(){

  this.openModalOpp = false;
}

}