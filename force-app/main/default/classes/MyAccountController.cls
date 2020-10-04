/**
 * Created by Bogdan on 04.10.2020.
 */

public with sharing class MyAccountController {
    @AuraEnabled
    public static List<Contact> getAccountContacts(Id accountId) {
        return [SELECT FirstName, LastName, Phone, Email FROM Contact WHERE AccountId = :accountId];
    }
}