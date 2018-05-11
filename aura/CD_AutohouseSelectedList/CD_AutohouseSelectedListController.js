({
//    doInit : function(component, event) {
//        var action = component.get("c.getAllAccounts");
//        action.setCallback(this, function(a) {
//            component.set("v.selectedAutohouses", a.getReturnValue());
//        });
//        $A.enqueueAction(action);
//    },
//     showOnMapClicked: function(component, event, helper) {
//            var index = event.getSource().get("v.value");
//            var event = $A.get("e.c:ShowAutohouseLocalizationEvent");
//            var autohouse = component.get("v.selectedAutohouses")[index];
//            console.log('map klick: '+autohouse);
//            event.setParams({"autohouse": autohouse});
//            event.fire();
//        },
     tableRowClicked: function(component, event, helper) {
             let autohouseId = event.currentTarget.dataset.id;
             let index = event.currentTarget.dataset.index;
             let selectedRowIndex = component.get("v.selectedRowIndex");

             if(!$A.util.isUndefinedOrNull(selectedRowIndex)){
                 helper.removeHighlightFromAllRows(component);
             }
             let rows = component.find("row");
             $A.util.addClass(rows[index], "row-highlighted");
             component.set("v.selectedRowIndex", index);

             helper.showAutohouseLocalizationOnMap(component, index);
             helper.showAutohouseDetails(component, autohouseId);

//             let eventShowDetails = $A.get("e.c:CD_SelectedAutohouseOnList");
//             eventShowDetails.setParams({"autohouseId": autohouseId});
//             eventShowDetails.fire();
//
//             let eventShowLocalization = $A.get("e.c:ShowAutohouseLocalizationEvent");
//             let autohouse = component.get("v.selectedAutohouses")[index];
//             eventShowLocalization.setParams({"autohouse": autohouse});
//             eventShowLocalization.fire();
         },
     removeHighlightFromAllRowsEventAction: function(component, event, helper) {
             console.log('remove color controler');
             helper.removeHighlightFromAllRows(component);
         }

})