/**
 * Created by Bogdan on 04.10.2020.
 */

({
  navToRecord : function (component, event, helper) {
    var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": component.get("v.contact.Id")
    });
    navEvt.fire();
  },
  editRecord : function(component, event, helper) {
    var editRecordEvent = $A.get("e.force:editRecord");
    editRecordEvent.setParams({
      "recordId": component.get("v.contact.Id")
    });
    editRecordEvent.fire();
  }
});