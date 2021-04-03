import { LightningElement, wire, track, api } from 'lwc';

export default class KiritTest extends LightningElement {
    @track resp = null;
    @track StateWiseData;
    @track parser;
    @track flag = false;
    //@track mapOfStateDistricts = [];
    handleCallout() {
        fetch("https://api.covid19india.org/state_district_wise.json")
            .then(response =>
                response.json().then(data => ({
                    data: data,
                    status: response.status
                })).then(res => {
                    //console.log(res.status, res.data)
                    let mapOfStateDistricts = [];
                    let mapOfCasesValues = [];
                    let mapOfCases = [];
                    let mapOfValues = [];
                    var District_list = [];
                    let State_list = [];
                    let statename;
                    var numbers = /^[-+]?[0-9]+$/;
                    this.resp = JSON.stringify(res.data);
                    // console.log('value of resp :'+JSON.stringify(res.data));
                    for (let [key, value] of Object.entries(res.data)) {
                        // console.log('State Name :'+key);
                        State_list.push(key);
                        for (let [key1, value1] of Object.entries(value)) {
                            for (let [key2, value2] of Object.entries(value1)) {
                                //console.log('District Name:'+key2);
                                if (!key2.match(numbers)) {
                                    District_list.push(key2);
                                    //District_list.push('a');
                                }

                                for (let [key3, value3] of Object.entries(value2)) {
                                    // console.log(key3+':'+value3);

                                }

                            }
                            //console.log('District_list :'+District_list);

                        }
                        //var map1 = { key: 'hi', value: ['bye1', 'bye2'] };
                        var a = [];
                        for (var p = 0; p < District_list.length; p++) {
                            a.push(District_list[p]);
                        }


                        console.log('h1212i' + a);
                        console.log('hhh1' + District_list.length);
                        console.log(typeof(District_list));
                        //var map = { key: State_list[0], value: a };
                        mapOfStateDistricts.push({ key: State_list[0], value: a });
                        //mapOfStateDistricts.push(map);
                        console.log(mapOfStateDistricts);
                        State_list.length = 0;
                        District_list.length = 0;
                    }


                }));

    }

}