({
  doInit: function (component, event, helper) {
    component.set("v.Columns", [
      {label: "Country name", fieldName: "name", type: "text"},
      {label: "Capital", fieldName: "capital", type: "text"},
      {label: "Population", fieldName: "population", type: "number"},
      {label: "Subregion", fieldName: "subregion", type: "text"},
      {label: "Currency code", fieldName: "currencyCode", type: "text"}
    ]);
  },

  handleSearchCountry : function (component, event, helper) {
    helper.searchCountry(component, event);
  }
})