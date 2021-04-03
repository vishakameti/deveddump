import { LightningElement, api, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { registerListener, unregisterAllListeners } from 'c/pubsub';

export default class CovidDist extends LightningElement {
    @api distdata;
    @wire(CurrentPageReference) pageRef;
    connectedCallback() {
        console.log('in connected callback1');
        registerListener('listdistricts', this.handledistrict, this);
    }
    disconnectedCallback() {
        // unsubscribe from bearListUpdate event
        unregisterAllListeners(this);
    }

    handledistrict(districtData) {
        console.log('count' + districtData.length);

        this.distdata = districtData;
    }
}