/**
 * Created by Bogdan on 04.10.2020.
 */

public with sharing class CountriesApiController {
    @AuraEnabled
    public static List<Country> getCountriesBySearchType(String searchKey, String searchType) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(getEndpointBySearchType(searchType) + searchKey);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        try {
            List<Country> countries = (List<Country>) JSON.deserialize(response.getBody(), List<Country>.class);
            for (Country c : countries) {
                c.currencyCode = '';
                for (CountryCurrency cc : c.currencies) {
                    c.currencyCode += ' ' + cc.code ;
                }
            }
            System.debug(countries);
            return countries;
        } catch (Exception e) {
            throw new AuraHandledException('Wrong input ' + e.getMessage());
        }
    }

    private static String getEndpointBySearchType(String searchType) {
        switch on searchType {
            when 'capital' {
                return 'https://restcountries.eu/rest/v2/capital/';
            }
            when 'name' {
                return 'https://restcountries.eu/rest/v2/name/';
            }
            when 'currency' {
                return 'https://restcountries.eu/rest/v2/currency/';
            }
        }
        return null;
    }

    public class Country {
        @AuraEnabled
        public String name { get; set; }
        @AuraEnabled
        public String capital { get; set; }
        @AuraEnabled
        public Integer population { get; set; }
        @AuraEnabled
        public String currencyCode;
        public CountryCurrency[] currencies { get; set; }
        @AuraEnabled
        public String subregion { get; set; }
        @AuraEnabled
        public String flag { get; set; }

    }

    public class CountryCurrency {
        public String code;
        public String name;
        public String symbol;
    }

}