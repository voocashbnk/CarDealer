public with sharing class CD_AutohouseSearchController {

    @AuraEnabled
    public static List<Account> getSelectedAutohouses(Account searchedAutohouse) {
        searchedAutohouse.BillingCountry = searchedAutohouse.BillingCountry == null ? '' : searchedAutohouse.BillingCountry;
        return [SELECT id,name, CD_Location__Latitude__s, CD_Location__Longitude__s
                FROM Account
                WHERE
                Name LIKE :'%' + searchedAutoHouse.Name + '%' AND
                CD_Location__Latitude__s != null AND
                CD_Location__Longitude__s != null
                ] ;
    }

    @AuraEnabled
    public static Account getAutohouseDetailsById(String autohouseId){
        return [SELECT Id, Name, Phone, Website, BillingCity FROM Account WHERE Id =: autohouseId];
    }

    @AuraEnabled
    public static List<Account> getAllAccounts(){
        return [SELECT id, name, CD_Location__Latitude__s, CD_Location__Longitude__s
                FROM Account
                WHERE CD_Location__Latitude__s != null AND
                CD_Location__Longitude__s != null
                LIMIT 20];
    }

}