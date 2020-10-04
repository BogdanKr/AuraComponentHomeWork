/**
 * Created by Bogdan on 04.10.2020.
 */

({
  fireEvent : function (component){
    let searchEvent = component.getEvent("searchCountryEvt");

    searchEvent.setParams({
      "searchKey": component.get("v.searchKey"),
      "searchType": component.get("v.searchType")
    });
    searchEvent.fire();
  }
});