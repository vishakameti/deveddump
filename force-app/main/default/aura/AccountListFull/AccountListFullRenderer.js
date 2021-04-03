({
    render : function(component, event, helper) {
        var ret = this.superRender();
        return ret;
        
    },
    // Your renderer method overrides go here
    afterRender : function(component, event, helper) {
        this.superAfterRender();
        var cmpbut = component.find("button21");
        console.log('Element: ' , cmpbut.getLocalId());

       $A.util.removeClass(cmpbut,'slds-hide');
       $A.util.addClass(cmpbut,'slds-show');
        this.superrerender();

        
    },
    rerender : function(cmp, helper){
        
        
    } 
})