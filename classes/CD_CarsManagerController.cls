public with sharing class CD_CarsManagerController {

    @AuraEnabled
    public static List<Product2> getCarsList(Product2 searchedCar){
        system.debug('given obj:___'+searchedCar);
        String model = '%a%';
        List<Product2> selectedCars = [SELECT id,Name,CD_ModelYear__c, CD_CarModel__c, CD_VIN__c
                                        FROM Product2
                                        WHERE CD_ModelYear__c = :searchedCar.CD_ModelYear__c  AND
                                        CD_CarModel__c = :searchedCar.CD_CarModel__c];
//                                        AND
//                                        CD_VIN__c LIKE :'%' + searchedCar.CD_VIN__c + '%' AND
//                                        Name LIKE :'%' + searchedCar.Name + '%'];

        system.debug('selected cars: '+selectedCars);
        return selectedCars;
    }
}

//14:40:48:002 SOQL_EXECUTE_BEGIN [6]|Aggregations:0|SELECT id, CD_CarBrand__c, CD_ModelYear__c, CD_CarModel__c, CD_VIN__c FROM Product2 WHERE (CD_ModelYear__c = :tmpVar1 AND CD_CarModel__c LIKE :tmpVar2 AND CD_VIN__c LIKE :tmpVar3 AND CD_CarBrand__c LIKE :tmpVar4)