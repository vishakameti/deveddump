({
	doInit : function(component, event, helper) {

        var action=component.get("c.accWrap");
        action.setCallback(this,function(response){
            
            var state = response.getState();
            if(state ==="SUCCESS"){
                var wrappers = new Array();
                var accs = response.getReturnValue();
                console.log('vvv'+accs.length);
                for(var idx=0;idx<accs.length;idx++){


                  //  console.log('json'+JSON.stringify(accs[idx]));
                    var wrapper = {'acc':accs[idx],
                                   'checkBox':false};
                    wrappers.push(wrapper);
                }
                component.set("v.AccL",accs);
                
            }else{
                console.log('failed');
            }
            
        });
        $A.enqueueAction(action);
    },
    saveAccs1 : function(component, event, helper) {
        alert('inaction');
        var action=component.get("c.receiveaccWrap");
        action.setParams({
            "wrapL" : component.get("v.AccL") 
        });
        action.setCallback(this,function(response){
            
            var state = response.getState();
            if(state ==="SUCCESS"){
                console.log(reponse.getReturnValue());
                
            }else{
                console.log('failed'+response.getState());
            }
            
        });
        $A.enqueueAction(action);
    },
})