({
    showAutohouseDetail: function(component, event) {
        let autohouseId = event.getParam("autohouseId");
        console.log('__________event param________'+autohouseId);
        var action = component.get("c.getAutohouseDetailsById");
        action.setParams({"autohouseId": autohouseId
        });

        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                console.log('SUKCES_____________');
                component.set("v.autohouse", response.getReturnValue());
                component.set("v.isRendered", true);
            }
                else{
                                console.log('error')
                                var clearDetails = component.get("v.autohouse");
                                clearDetails.Name = '';
                                clearDetails.Website = '';
                                clearDetails.Phone = '';
                                clearDetails.BillingCity = '';
                                clearDetails.Id = '';
                                component.set("v.autohouse", clearDetails);
                                component.set("v.isRendered", false);
                            }
//            else{
//                console.log('ERROR______________');
//                var emptyDetails = component.get("v.autohouse");
//
//                emptyDetails.Website='';
//                emptyDetails.Name='';
//                emptyDetails.BillingCity='';
//                emptyDetails.Id='';
//                emptyDetails.Phone='';
//
//            component.set("v.autohouse", emptyDetails);
//            component.set("v.isRendered", false);
//            }
        });
        $A.enqueueAction(action);
    }
})