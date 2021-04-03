({
	onLoad: function(component, event, helper) {
        // Create the action
        var action = component.get("c.countAcc");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {

                component.set("v.count",response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
     createAccount : function(component, event, helper) {

        var recordEvent=$A.get("e.force:createRecord");
        recordEvent.setParams({
            "entityApiName": "Account",
            "defaultFieldValues":{
                "Industry":"Apparel"
            }
        });
        recordEvent.fire();
 },
    fireEvent:function(component, event, helper){

      var registerEvent = component.getEvent("myTestEvent1");

        registerEvent.setParams({"Message":"Vishak"});
        registerEvent.fire();
    },
})