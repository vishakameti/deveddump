({
	doInit : function(component, event, helper) {
		var action = component.get('c.myclass');
        
        action.setCallback(this,function(response){
            
            var state = response.getState();
            
            if(state==="SUCCESS"){
                var List1 = response.getReturnValue();
                 
                console.log(List1);
                /*
                var myStates = {};
                  Object.keys(map).forEach(function(key){ 
                     //  console.log(map[key].stateCounts);
                      var myFinalObject = {};
                      myFinalObject.state = key;
                      myFinalObject.statecount = map[key];
                      
                });
                */
                component.set("v.myList",response.getReturnValue());
            }
                
        })
        $A.enqueueAction(action);
	},
})