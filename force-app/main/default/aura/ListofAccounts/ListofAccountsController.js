({
    doInit : function(component, event, helper) {
        var action=component.get("c.AccList");
        action.setCallback(this,function(response){
            
            var state = response.getState();
            if(state ==="SUCCESS"){
                console.log(response.getReturnValue());
                component.set("v.AccL",response.getReturnValue());
            }else{
                console.log('failed');
            }
            
        });
        $A.enqueueAction(action);
    },
        route : function(component, event, helper) {

            var myId = event.getSource().get("v.value");
            
            var route = $A.get("e.force:navigateToSObject");
            route.setParams({
                "recordId":myId
            });
            route.fire();
        
    },
    saveAccs : function(component, event, helper){
        console.log('vishak');
        var accList = component.get('v.AccL');
        var action = component.get('c.saveAccount');
        action.setParams({"myAccs":accList});
        action.setCallback(this,function(response){
            
            var state = response.getState();
            if(state ==="SUCCESS"){
                console.log(response.getReturnValue());
                alert('success');
            }else{
                console.log('failed');
            }
            
        });
        $A.enqueueAction(action);
    },
    
})