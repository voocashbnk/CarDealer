public with sharing class CD_CarsManagerController {

    @AuraEnabled
    public static List<Product2> getCarsList(Product2 searchedCar){
        return Database.query(generateQueryStringForSearchedCars(searchedCar));
//        system.debug('given obj:___'+searchedCar);
//        String model = '%a%';
//        List<Product2> selectedCars = [SELECT id,Name,CD_ModelYear__c, CD_CarModel__c, CD_VIN__c
//                                        FROM Product2
//                                        WHERE CD_ModelYear__c = :searchedCar.CD_ModelYear__c  AND
//                                        CD_CarModel__c = :searchedCar.CD_CarModel__c];
////                                        AND
////                                        CD_VIN__c LIKE :'%' + searchedCar.CD_VIN__c + '%' AND
////                                        Name LIKE :'%' + searchedCar.Name + '%'];
//
//        system.debug('selected cars: '+selectedCars);
//        return selectedCars;
    }

    private static String generateQueryStringForSearchedCars(Product2 searchedCar){
        String queryString;
        String conditionsSection = '';
        queryString = 'SELECT Id, Name, CD_VIN__c, CD_ModelYear__c, CD_CarModel__c FROM Product2 ';
        queryString+=  (String.isBlank(searchedCar.Name) &&
                String.isBlank(searchedCar.CD_VIN__c) &&
                searchedCar.CD_ModelYear__c == null &&
                String.isBlank(searchedCar.CD_CarModel__c)) ? '' : 'WHERE ';

        conditionsSection+= String.isBlank(searchedCar.Name) ? '' : 'Name LIKE \'%' + searchedCar.Name + '%\'';
        conditionsSection+= String.isNotBlank(conditionsSection) && String.isNotBlank(searchedCar.CD_VIN__c) ?  ' AND ' : '' ;
        conditionsSection+= String.isBlank(searchedCar.CD_VIN__c) ? '' : 'CD_VIN__c LIKE \'%' + searchedCar.CD_VIN__c + '%\'';
        conditionsSection+= String.isNotBlank(conditionsSection) && searchedCar.CD_ModelYear__c != null ? ' AND ' : '' ;
        conditionsSection+= searchedCar.CD_ModelYear__c == null ? '' : 'CD_ModelYear__c LIKE \'%' + searchedCar.CD_ModelYear__c + '%\'';
        conditionsSection+= String.isNotBlank(conditionsSection) && String.isNotBlank(searchedCar.CD_CarModel__c) ? ' AND ' : '' ;
        conditionsSection+= String.isBlank(searchedCar.CD_CarModel__c) ? '' : 'CD_CarModel__c = \'' + searchedCar.CD_CarModel__c + '\'';


        queryString+= conditionsSection == null ? '' : conditionsSection;
        system.debug(queryString);
        return queryString;
    }
}