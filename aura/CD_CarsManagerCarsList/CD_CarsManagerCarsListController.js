({
    searchCars: function(component, event, helper){
        var searchedCar = component.get("v.searchedCar");
        console.log('car JSON', JSON.stringify(searchedCar));
        helper.getCars(component, searchedCar);
    },
    clearForm: function(component, event, helper){
        
    }
})