({
    loadAccData : function(component, event, helper) {
        
        
        var Action = component.get("c.getAccount1");
        
        // alert('Action'+Action);
        
        Action.setCallback(this, function(response){
            // alert('hi');
            var state = response.getState();
            //  alert('state is:'+state);
            if(state=="SUCCESS"){
                //  alert(response.getReturnValue);
                component.set("v.listAcc",response.getReturnValue());
            } 
            else{
                console.log("Failed with state: " + state);
            }});
        
        $A.enqueueAction(Action);
    }, 
    deleteAccount : function(component, event, helper) {        
        alert('v');
        var action2 = component.get("c.deleteAcc");
        var myId = event.target.id;
        alert(myId +'is the id');
        var result=confirm("are you sure my friend?");
        
        if(result){
            action2.setParams({ Accid : myId});
            
            $A.enqueueAction(action2);
            var Action = component.get("c.getAccount1");
            var Action = component.get("c.getAccount1");
            
            // alert('Action'+Action);
            
            Action.setCallback(this, function(response){
                // alert('hi');
                var state = response.getState();
                //  alert('state is:'+state);
                if(state=="SUCCESS"){
                    //  alert(response.getReturnValue);
                    component.set("v.listAcc",response.getReturnValue());
                } 
                else{
                    console.log("Failed with state: " + state);
                }});
            
            $A.enqueueAction(Action);
        }
        
    },
    navigateToMyComponent : function(component, event, helper) {
        var accId = event.target.id;
        alert(accId);
        var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef : "c:orderdetail",
            componentAttributes: {                
                accId : "0017F000006Q9EkQAK"
            }
        });
        evt.fire();
    }
    
    
})