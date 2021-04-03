({
	execute : function(component, event, helper) {
		// TODO: Review the migrated code
		if (''+component.get('v.sObjectInfo.Account.Name')+'' == 'vishak') 
  {
helper.gotoURL(component, '/apex/CanBidHome');
}


	},

	accept : function(component, event, helper) {
		$A.get("e.force:closeQuickAction").fire();
	}
})