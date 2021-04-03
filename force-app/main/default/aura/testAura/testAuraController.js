({
	doit : function(component, event, helper) {
        
        var action = component.get("c.accList");
        
        action.setCallback(this, function(a) {      
            var accounts = a.getReturnValue();
            console.log(accounts);
                component.set("v.Accs",accounts);            
        });
            
        $A.enqueueAction(action);
	}
})