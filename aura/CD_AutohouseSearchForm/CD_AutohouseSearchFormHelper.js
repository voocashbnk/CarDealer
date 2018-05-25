({
    getAutohouses: function(component, searchedAutohouse) {
            var action = component.get("c.getSelectedAutohouses");
            action.setParams(
                {
                "searchedAutohouse": searchedAutohouse
                });
            action.setCallback(this, function(response){
                var state = response.getState();
                if (state === "SUCCESS") {
                    component.set("v.selectedAutohouses", response.getReturnValue());
                    window.setTimeout($A.getCallback(function() {
                                        var event = $A.get("e.c:AutohousesLoaded");
                                        event.setParams({"autohouses": response.getReturnValue()});
                                        event.fire();
                                    }), 500);
                }
            });
            $A.enqueueAction(action);
        },

    showDetails: function(component, autohouseId) {
          let eventShowDetails = $A.get("e.c:CD_SelectedAutohouseOnList");
          eventShowDetails.setParams({"autohouseId": autohouseId});
          eventShowDetails.fire();
      },
})