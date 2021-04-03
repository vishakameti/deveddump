({
	handleCompEve : function(component, event, helper) {

        var data = event.getParam("Message");
		component.set("v.myMes",data);
	},
    fire1 : function(component, event, helper) {
        alert('firing');
        var appEvent = $A.get("e.c:AppEvent1");
        appEvent.setParams({"Message":"Hey"});
        appEvent.fire();
	},
})