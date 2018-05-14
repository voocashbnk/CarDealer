({
    getCars: function(component, searchedCar){
        var action = component.get("c.getCarsList");
        console.log('action__'+action);
        action.setParams({
            "searchedCar" : searchedCar
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.cars", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
})