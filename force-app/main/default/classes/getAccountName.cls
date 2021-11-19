public with sharing class getAccountName {
    


    @AuraEnabled(cacheable=true)

    public static Account getSingleAccount(){
        return [SELECT Id, Name FROM Account LIMIT 1];
    }

}
