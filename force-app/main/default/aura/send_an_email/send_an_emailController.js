({
    redirectEmail : function(component, event, helper) {
        //alert('in redirectEmail');
        var action = component.get("c.emailTemplate");
        var vipId = component.get("v.recordId");
        
        var vipFan = component.get("v.FAN__c");
        alert('vipFan'+vipFan);
        action.setCallback(this,function(response){
        //alert('in action call back');    
            var state = response.getState();
          //  alert('state is'+state);
            if(state=="SUCCESS"){            
                var templateId = response.getReturnValue();
            //    alert(templateId);
            //    
                var urlTemp = "/email/author/emailauthor.jsp?p3_lkid="+vipId+"&retURL="+vipId+"&template_id="+templateId;
                //var urlTemp = "/email/author/emailauthor.jsp?template_id="+templateId;
                //var urlTemp="/apex/canBidHome";
                //alert(urlTemp);
                var urlEvent = $A.get("e.force:navigateToURL");
                urlEvent.setParams({
                    "url": urlTemp
                });
                //urlEvent.fire();
                window.open(urlTemp,'_top')

                //component.goToURL(urlTemp);
            }
            else{
                alert('failed with state'+state);
                console.log('failed with state'+state);            
            }});
        
        $A.enqueueAction(action);
    }
})