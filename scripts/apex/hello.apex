// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

List<String> accountNames = new List<String>{'Amanda','Jon','Valentina','Francis'};
List<Account> accounts = new List<Account>{};
List<Offer_Tag__c> offerTags = new List<Offer_Tag__c>{};

static final Integer OFFERS_FOR_ACCOUNT = 4;
static final Integer TAGS_FOR_OFFER = 4;

    for(String s: accountNames){
        Account a = new Account(Name = s);
        accounts.add(a);
    }

   for(Integer i = 0; i < accountNames.size() * OFFERS_FOR_ACCOUNT * TAGS_FOR_OFFER; i++){
            Offer_Tag__c tag = new Offer_Tag__c(Name = 'tag ' + i);
            offerTags.add(tag);
        }

     insert offerTags;
     insert accounts;

    

    
    for(Account a : accounts){

        for(Integer i = 0; i < 4; i++){

            My_Offer__c offer1 = new My_Offer__c(
                                            Account__c = a.id, 
                                            Name__c = 'Investice', 
                                            Tag_1__c = offerTags.get(0).Id, 
                                            Tag_2__c = offerTags.get(1).Id, 
                                            Tag_3__c = offerTags.get(2).Id, 
                                            Tag_4__c = offerTags.get(3).Id 
                                            );
                                            System.debug(offer1);
            
        }
}

 System.debug(accounts.toString());





  



