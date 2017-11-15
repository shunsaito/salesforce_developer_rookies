trigger OpportunityTrigger on Opportunity (after insert) {
    OpportunityTriggerHandler handler = new OpportunityTriggerHandler();
    if(Trigger.isInsert && Trigger.isAfter){
        handler.onAfterInsert(Trigger.new);
    }
}