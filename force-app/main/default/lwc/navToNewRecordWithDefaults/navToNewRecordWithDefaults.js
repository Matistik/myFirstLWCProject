import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';

export default class NavToNewRecordWithDefaults extends NavigationMixin(
    LightningElement
) {
    navigateToNewContactWithDefaults() {
        const defaultValues = encodeDefaultFieldValues({
            AccountId: 'Miso',
            Amount: 1000,
            
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
}
