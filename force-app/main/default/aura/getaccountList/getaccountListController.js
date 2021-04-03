({
	doget : function(component, event, helper) {
        
        var action = component.get("c.accList");
        
        action.setCallback(this,function(response){
            
            console.log(response.getReturnValue());
            component.set("v.accList",response.getReturnValue());
            /*
                var records = response.getReturnValue();
                for(var i=0;i< records.length;i++){
                    var record = records[i];
                    alert(record.id);
                    var myItem = {id:record.id,name:record.name,annualrevenue:record.annualrevenue};
                    item.push(myItem);
                }
                alert(JSON.stringify(item));
              */  
                
            
            
        });
        
        $A.enqueueAction(action);

		
	},changemode : function(component, event, helper) {
        
        var accEvent=component.getEvent("accEvent");
        accEvent.setParams({
            "click" : 1
        });
        accEvent.fire();
        if(component.get("v.mode")=="readonly"){
        component.set("v.mode","edit");
            }
        else
        {
            component.set("v.mode","readonly");
        }
		
	}
})