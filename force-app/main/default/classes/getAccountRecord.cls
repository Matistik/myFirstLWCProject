public with sharing class getAccountRecord {

  

    @AuraEnabled(cacheable=true)

    public static List<My_offer__c> getAccountRecordMethod(String recordIdAccount) {


      

        

    List<My_offer__c> accList=[SELECT Id, Name__c, Tag_1__c, Tag_2__c, Tag_3__c ,Tag_4__c, 	Documentation_URL__c, 	Description__c, Comment__c

        FROM My_offer__c

        Where Account__c=:recordIdAccount];

        Integer debugNumber = 0;

        for (Integer i = 0; i < accList.size(); i++) {

            debugNumber++;

            System.debug('name ' + accList.get(i).Name__c);


        }

        return accList;

    }

    

}
