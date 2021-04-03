({
  // Fetch the accounts from the Apex controller
  getAccountList: function(component) {
    var action = component.get('c.getrecalls');

    // Set up the callback
    var self = this;
    action.setCallback(this, function(actionResult) {
     component.set('v.recalls', actionResult.getReturnValue());
    });
    $A.enqueueAction(action);
  }
})