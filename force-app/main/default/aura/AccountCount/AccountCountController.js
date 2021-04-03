({
	doInit : function(component, event, helper) {
		var action = component.get("c.countAcc");

        action.setCallback(this,function(response){
            
            
            console.log(response.getReturnValue());
            component.set("v.mycount",response.getReturnValue());   
            
        });
        
        $A.enqueueAction(action);
	},
    doInit2 : function(component, event, helper) {
		var action = component.get("c.countAcc");

        action.setCallback(this,function(response){
            
            
            console.log(response.getReturnValue());
            component.set("v.mycount",response.getReturnValue());   

            
        });
        
        $A.enqueueAction(action);
	}
})