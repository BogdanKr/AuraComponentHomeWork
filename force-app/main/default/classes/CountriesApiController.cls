/**
 * Created by Bogdan on 04.10.2020.
 */

public with sharing class CountriesApiController {

    public static List<Country> getCountriesBySearchType(String searchKey, String searchType) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(getEndpointBySearchType(searchType) + searchKey);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        List<Country> countries = (List<Country>) JSON.deserialize(response.getBody(), List<Country>.class);
        System.debug(countries);

        return countries;

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
        public String name;
        public String capital;
        public CountryCurrency[] currencies;
        public String subregion;
        public String flag;
    }

    public  class CountryCurrency {
        public String code;
        public String name;
        public String symbol;
    }

}