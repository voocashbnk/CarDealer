
({
    searchCars: function(component, event, helper){
        var searchedCar = component.get("v.searchedCar");
        console.log('serched car: '+searchedCar);
        console.log('serched car: '+searchedCar.CD_ModelYear__c);
        helper.getCars(component, searchedCar);

    },
})