({
	changemode : function(component, event, helper) {
        
        if(component.get("v.mode")=="readonly"){
        component.set("v.mode","edit");
            }
        else
        {
            component.set("v.mode","readonly");
        }
		
	},
    
    onclick : function(component,event,helper){
        
        var intval = event.getParam("click");
        var integera = component.get("v.countofaccs");        
        intval=integera+1;
        component.set("v.countofaccs",intval);
    }
})