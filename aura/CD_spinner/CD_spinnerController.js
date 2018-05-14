({
    waiting: function(component, event, helper) {
        document.getElementById("Accspinner").style.display = "block";
//        window.setTimeout(function(){document.getElementById("Accspinner").style.display = "none";}, 450);
     },

       doneWaiting: function(component, event, helper) {
       document.getElementById("Accspinner").style.display = "none";
     },
})