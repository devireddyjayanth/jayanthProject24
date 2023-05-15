public with sharing class CalculateNumbers {
    @AuraEnabled
    public static Integer getSumResult(Integer firstNumber, Integer secondNumber){
        try {
            return (firstNumber + secondNumber);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}