public with sharing class CD_CarsManagerController {

    @AuraEnabled
    public static List<Product2> getCarsList(Product2 searchedCar){
        system.debug('given obj:___'+searchedCar);
        return [SELECT id,name,CD_ModelYear__c, CD_CarModel__c, CD_VIN__c
                FROM Product2
                WHERE CD_ModelYear__c LIKE :searchedCar.CD_ModelYear__c  AND
                CD_CarModel__c LIKE :'%' + searchedCar.CD_CarModel__c + '%' AND
                CD_VIN__c LIKE :'%' + searchedCar.CD_VIN__c + '%' AND
                name LIKE :'%' + searchedCar.Name + '%'];
    }
}