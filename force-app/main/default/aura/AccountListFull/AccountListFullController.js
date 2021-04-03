({
    doInit : function(component, event, helper) {                
        var action = component.get("c.AccList");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {

                      component.set("v.Acclist",response.getReturnValue());

            }
            else {
                console.log("Failed with state: " + state);
            }
        });
             
        $A.enqueueAction(action);
    },
    
    
    showToast : function(component, event, helper) {
        var vishak="ameti";
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": vishak,
        "message": "The record has been updated successfully."
    });
    toastEvent.fire();
}
})