public with sharing class MC_MechanicPublicSiteController {
    public Integer numberOfRecordsToDisplay {get; set;}
    public List<MC_Mechanic__c> allMechanics {get;set;}
    public final Integer maximumNoOfRecordsToDisplay = 5;
    public String siteURL {get; set;}

    public MC_MechanicPublicSiteController(ApexPages.standardController controller){
        siteURL = Site.getBaseUrl();
        Integer checkCount = getAllMechanicsCount();
        if (checkCount<maximumNoOfRecordsToDisplay){
            numberOfRecordsToDisplay = checkCount;
        } else numberOfRecordsToDisplay = maximumNoOfRecordsToDisplay;
            allMechanics = getMechanicsToDisplay();
    }

    public List<MC_Mechanic__c> getMechanicsToDisplay(){
        List<MC_Mechanic__c> mechanics = new List<MC_Mechanic__c>();
        List<Integer> randomIntegers = getRandomIntegers(numberOfRecordsToDisplay);
        for(Integer i=0; i < numberOfRecordsToDisplay; i++){
            List<MC_Mechanic__c> tempList = [SELECT Id, Name, MC_FirstName__c, MC_fullName__c, MC_City__c, MC_Country__c
                                            FROM MC_Mechanic__c
                                            ORDER BY id
                                            LIMIT 1 OFFSET :randomIntegers[i]
                                            ];
            mechanics.add(tempList[0]);
        }
        return mechanics;
    }

    private Integer getAllMechanicsCount(){
        List<AggregateResult> allMechanics = [SELECT count(Id)cnt FROM MC_Mechanic__c];
        return (Integer) allMechanics[0].get('cnt');
    }

    private List<Integer> getRandomIntegers(Integer size){
        Set<Integer> randomIntegers = new Set<Integer>();
        Integer randomRange = getAllMechanicsCount()-1;
        while (randomIntegers.size() < numberOfRecordsToDisplay){
            randomIntegers.add(Math.round(Math.random()*randomRange));
        }
        return new List<Integer>(randomIntegers);
    }


}