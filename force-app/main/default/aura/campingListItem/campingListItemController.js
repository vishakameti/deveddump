({
	getCMIList: function(component, event, helper) {
		var action = component.get("c.getCampingItem");
		action.setCallback(this, function(actionResult) {
			var state = actionResult.getState();
			if (state === "SUCCESS"){
                console.log("vishak"+ actionResult.getReturnValue());
				component.set("v.item", actionResult.getReturnValue());
                
			}
			else if (state === "ERROR") {
				var errors = actionResult.getError();
				if (errors) {
					if (errors[0] && errors[0].message) {
						console.log("Error message: " + 
						errors[0].message);
					}
				}
				else {
					console.log("Unknown error");
				}
			}
		});
		$A.enqueueAction(action);
	}
})