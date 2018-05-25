({
    waiting: function(component, event, helper) {
        document.getElementById("Accspinner").style.display = "block";
    },

       doneWaiting: function(component, event, helper) {
       document.getElementById("Accspinner").style.display = "none";
    },
})