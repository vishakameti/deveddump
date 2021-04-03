/* eslint-disable no-console */
import { LightningElement, wire, track, api } from 'lwc';
import { NavigationMixin, CurrentPageReference } from 'lightning/navigation';
import { fireEvent } from 'c/pubsub';

import getStatewise from '@salesforce/apex/JSONParse3.hitCovidApi';

export default class CovidStates extends LightningElement {

    jswrapper;
    Indiaicon = 'https://cdn.countryflags.com/thumbs/india/flag-waving-250.png';
    countrytotal;
    countryactive;
    countryrecovered;
    countrydeaths;
    newCasestoday;
    newDeathstoday;

    @track hover;
    @track statewiseList;
    @track myerror;
    @wire(CurrentPageReference) pageRef;
    @wire(getStatewise)
    mystates({ error, data }) {

        this.jswrapper = [];
        this.hover = [];
        if (data) {

            //console.log('vishak new1');
            this.statewiseList = data;
            this.countrytotal = 0;
            this.countryactive = 0;
            this.countryrecovered = 0;
            this.countrydeaths = 0;
            this.newCasestoday = 0;
            this.newDeathstoday = 0;
            this.hover = false;
            // iterating API response coming from Apex wrapper class. 
            for (var i = 0; i < this.statewiseList.length; i++) {
                var statecounttotal = 0;
                var stateactivecount = 0;
                var staterecoveredcount = 0;
                var statedthcount = 0;
                var statedelta = 0;
                var statedelDeath = 0;
                var newdeath = false;
                var newcase = false;
                // iterate over district data for each state to get district counts and delta day counts.
                for (var j = 0; j < this.statewiseList[i].districtData.length; j++) {
                    // console.log('district' + this.statewiseList[i].districtData[j].district);
                    statecounttotal = statecounttotal + this.statewiseList[i].districtData[j].confirmed;
                    stateactivecount = stateactivecount + this.statewiseList[i].districtData[j].active;
                    staterecoveredcount = staterecoveredcount + this.statewiseList[i].districtData[j].recovered;
                    statedthcount = statedthcount + this.statewiseList[i].districtData[j].deceased;
                    statedelta = statedelta + this.statewiseList[i].districtData[j].delta.confirmed;
                    statedelDeath = statedelDeath + this.statewiseList[i].districtData[j].delta.deceased;

                }
                var a = {};
                a["statename"] = this.statewiseList[i].state;
                a["statetotal"] = statecounttotal;
                a["stateactive"] = stateactivecount;
                a["staterecovered"] = staterecoveredcount;
                a["statedeaths"] = statedthcount;
                a["statedelta"] = statedelta;
                a["statedelDeath"] = statedelDeath;
                a["distdata"] = this.statewiseList[i].districtData;
                a["statecode"] = this.statewiseList[i].statecode;
                if (statedelta > 0) {
                    a["newcase"] = true;
                }
                if (statedelDeath > 0) {
                    a["newdeath"] = true;
                }
                this.jswrapper.push(a);
                this.countrytotal = this.countrytotal + statecounttotal;
                this.countryactive = this.countryactive + stateactivecount;
                this.countryrecovered = this.countryrecovered + staterecoveredcount;
                this.countrydeaths = this.countrydeaths + statedthcount;
                this.newCasestoday = this.newCasestoday + statedelta;
            }
        } else if (error) {
            this.myerror = error;
        }

    }
    handleChild(event) {

        //var childDistrict = event.target.getAttribute('data-dist');
        console.log('div3 click');
        var childstatename = event.currentTarget.getAttribute('data-dist');
        var myobj;
        var state1 = 'Andhra Pradesh';
        for (var k = 0; k < this.jswrapper.length; k++) {
            if (this.jswrapper[k].statename == childstatename) {
                console.log('lllll1121' + JSON.stringify(this.jswrapper[k].distdata));
                myobj = this.jswrapper[k].distdata;
            }
        }
        console.log('my data' + JSON.stringify(this.jswrapper[state1]));

        fireEvent(this.pageRef, 'listdistricts', myobj);
    }

    handleshow(event) {
        //alert('vishak' + event.target.className);
        //console.log('in vishak');
        var b = event.target.getAttribute('data-class1');
        console.log('hmmmm' + b.length);
        //console.log(b);

        var className = '.' + b;
        //console.log('ahhh' + className);
        // console.log('hmm:' + this.template.querySelectorAll(className).length);
        this.template.querySelectorAll(className).forEach(element => {
            if (element.style.display === 'none') {
                element.style.display = 'block';
            } else {
                element.style.display = 'none';
            }

        });
    }
}