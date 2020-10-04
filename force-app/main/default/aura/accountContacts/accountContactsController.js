/**
 * Created by Bogdan on 04.10.2020.
 */

({
  doInit: function (component, event, helper) {
    console.log('doInit pending');
    let spinner = component.find("spinner");
    $A.util.removeClass(spinner, "slds-hide");

    let action = component.get("c.getAccountContacts");
    action.setParams({
      accountId: component.get("v.recordId"),
    });

    action.setCallback(this, function (response) {

        console.log("Account contacts loaded successful");
        let accountContacts = response.getReturnValue();
        component.set("v.contacts", accountContacts);

      $A.util.addClass(spinner, "slds-hide");
    });
    $A.enqueueAction(action);
  }
});