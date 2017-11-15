public with sharing class OpportunityTriggerHandler {

    // HACK カスタム表示ラベル、カスタムメタデータなどに出して変更可能にすること
    private static final String targetSubject = '契約書送付';
    private static final Integer targetDue = -7;

    public void OnAfterInsert(List<Opportunity> newItems){
        List<Task> tasks = new List<Task>();
        for (Opportunity item : newItems) {
            tasks.add(createTaskForOpportunity(item));
        }
        TaskDao.insertTasks(tasks, false);
    }

    private static Task createTaskForOpportunity(Opportunity item) {
        Task task = new Task();
        task.Subject = targetSubject;
        task.ActivityDate = item.CloseDate.addDays(targetDue);
        task.WhoId = item.Owner.Id;
        task.WhatId = item.Id;
        return task;
    } 

}