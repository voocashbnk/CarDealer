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

