import { LightningElement ,api} from 'lwc';



export default class Ldslearning extends LightningElement {
    @api recordId;
    @api objectApiName;
    fields=['Name','Phone','billingAddress','Title','Email'];
}