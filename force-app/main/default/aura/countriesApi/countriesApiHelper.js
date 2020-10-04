/**
 * Created by Bogdan on 04.10.2020.
 */

({
  searchCountry : function (component, event){
    let searchKey = event.getParam("searchKey");
    let searchType = event.getParam("searchType");

    let action = component.get("c.getCountriesBySearchType");
    action.setParams({
      searchKey: searchKey,
      searchType : searchType
    });

    action.setCallback(this, function(response) {

      if (response.getState() === "SUCCESS" || response.getState() === "DRAFT") {
        component.set("v.countries", response.getReturnValue());
        console.log("Countries loaded");
        component.set("v.showError",false);
      } else if (response.getState() === "INCOMPLETE") {
        console.log("User is offline, device doesn't support drafts.");
      } else if (response.getState() === "ERROR") {
        console.log('Problem getting countries, error: ' + JSON.stringify(response.getState()));
        let errors = response.getError();
        component.set("v.showError",true);
        component.set("v.errorMessage",errors[0].message);
      } else {
        console.log('Unknown problem, state: ' + response.getState() + ', error: ' + JSON.stringify(response.getState()));
      }
    });
    $A.enqueueAction(action);
  }
});