@isTest
public with sharing class generateDataTest {
    

    public static List<Account> generateAccountsTest(Integer accs, Integer offers){
    
            List<Account> accounts = new List<Account>();

            
        
            
        
            for(Integer i = 0 ; i<accs;i++){
        
              Account account = new Account();
              account.Name = 'test acc ' + i;
        
              accounts.add(account);
            }
            insert accounts;
        
            for(Account account : accounts){
              
        
              generateMyOffersAndAddOfferTags(account,offers);
        
            }

            return accounts;
        
          }
        
          public static void generateMyOffersAndAddOfferTags(Account account, Integer offerNum){
        
            List<Offer_Tag__c> offerTags = new List<Offer_Tag__c>();
            List<My_Offer__c> myOffers = new List<My_Offer__c>();
        
            for(Integer i = 0; i < offerNum; i++){
                            offerTags = generateOfferTags();
                            My_Offer__c myOffer1 = new My_Offer__c(
                                                    Account__c = account.id, 
                                                    Name__c = 'Investice ' + i, 
                                                    Tag_1__c = offerTags.get(0).Id, 
                                                    Tag_2__c = offerTags.get(1).Id, 
                                                    Tag_3__c = offerTags.get(2).Id, 
                                                    Tag_4__c = offerTags.get(3).Id 
                                                    );
        
                                         myOffers.add(myOffer1);
        
        
            }
            
                 insert myOffers;
          }
          
          public static List<Offer_Tag__c> generateOfferTags(){
        
            List<Offer_Tag__c> offerTags = new List<Offer_Tag__c>();
        
            for(Integer i = 0; i < 4; i++){
                Offer_Tag__c offerTag1 = new Offer_Tag__c(Name='Tag ' + i);
                offerTags.add(offerTag1);
            }
             
              insert offerTags;
        
              return offerTags;
        
          }
    }
    