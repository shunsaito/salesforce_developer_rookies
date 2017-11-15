public with sharing class TaskDao {
    public static List<Database.SaveResult> insertTasks(List<Task> items,  boolean allOrNone) {
        return Database.insert(items, allOrNone);
    }
}