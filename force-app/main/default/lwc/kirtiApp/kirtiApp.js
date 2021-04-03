import { LightningElement, track, api } from 'lwc';

export default class KirtiApp extends LightningElement {
    @track stateObject;
    @track caseObject;
    @track resp = null;
    @track casevalues = new Map();
    @track casevalues1 = [];
    @track mapofstatedistrict = new Map();
    @track mapofstatedistrict1 = [];
    @track mapofdistcases = new Map();
    @track mapofdistcases1 = [];
    handlecallout() {
        fetch("https://api.covid19india.org/state_district_wise.json")
            .then(response =>
                response.json().then(data => ({
                    data: data,
                    status: response.status
                })).then(res => {
                    var District_list = [];
                    var State_list = [];

                    var numbers = /^[-+]?[0-9]+$/;
                    var alldata = {};
                    this.resp = JSON.stringify(res.data);

                    for (let [key, value] of Object.entries(res.data)) {
                        if (!key.match(numbers)) {
                            State_list.push(key);

                            for (let [key1, value1] of Object.entries(value)) {
                                for (let [key2, value2] of Object.entries(value1)) {
                                    if (!key2.match(numbers)) {
                                        District_list.push(key2);
                                        for (let [key3, value3] of Object.entries(value2)) {
                                            this.casevalues.set(key3, value3);
                                            var l = {};
                                            l['key'] = key3;
                                            l['value'] = value3;
                                            this.casevalues1.push(l);
                                        }
                                        this.mapofdistcases.set(key2, Object.fromEntries(this.casevalues));
                                        var j = {};
                                        j['key'] = key2;
                                        j['value'] = this.casevalues1;
                                        this.mapofdistcases1.push(j);
                                        this.casevalues.clear();
                                        this.casevalues1 = [];
                                    }
                                }
                            }
                            this.mapofstatedistrict.set(key, Object.fromEntries(this.mapofdistcases));
                            var k = {};
                            k['key'] = key;
                            k['value'] = this.mapofdistcases1;
                            this.mapofstatedistrict1.push(k);

                            this.mapofdistcases.clear();
                            this.mapofdistcases1 = [];
                            State_list.length = 0;
                            District_list.length = 0;
                        }
                    }
                    console.log(this.mapofstatedistrict);
                    console.log(this.mapofstatedistrict1);
                    console.log(typeof(this.mapofstatedistrict1));
                    //this.mapofstatedistrict1.push(this.mapofstatedistrict);
                    console.log(this.mapofstatedistrict1);

                }));
        //return this.mapofstatedistrict.toString();
    }
}