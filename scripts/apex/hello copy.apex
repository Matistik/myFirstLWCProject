/**
 * Created by Ivan Micik 10/22/2021
 */
 
public with sharing class GenerateData {

  public void generateAccounts(){

    List<Account> accounts = new List<Account>();

    List<String> accountNames = new List<String>{'Amanda','Jon','Valentina','Francis'};

    for(Integer i = 0 ; i<accountNames.size();i++){

      Account account = new Account();
      account.Name = accountNames[i];

      accounts.add(account);
    }
    insert accounts;

    for(Account account : accounts){
      

      generateMyOffersAndAddOfferTags(account);

    }

  }

  public void generateMyOffersAndAddOfferTags(Account account){

    List<Offer_Tag__c> offerTags = new List<Offer_Tag__c>();
    List<My_Offer__c> myOffers = new List<My_Offer__c>();

    for(Integer i = 0; i < 4; i++){
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
  
  public List<Offer_Tag__c> generateOfferTags(){

    List<Offer_Tag__c> offerTags = new List<Offer_Tag__c>();

    for(Integer i = 0; i < 4; i++){
        Offer_Tag__c offerTag1 = new Offer_Tag__c(Name='Tag ' + i);
        offerTags.add(offerTag1);
    }
     
      insert offerTags;

      return offerTags;

  }
}