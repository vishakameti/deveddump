({
	doInit : function(component, event, helper) {

        var isEnabled = $A.get("e.force:createRecord");
        if(isEnabled){
            component.set("v.showNew",true);
        }else{
            component.set("v.showNew",false);
        }
	},
    handleNewboat : function(component, event, helper){
      
        var createEvent = $A.get("e.force:createRecord");
        createEvent.setParams({
            "entityApiName": "Boat__c" 
        });    
        createEvent.fire();
    },
})