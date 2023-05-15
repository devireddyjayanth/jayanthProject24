public class QueuableApexEx1 implements Queueable{
    
    public void execute(QueueableContext qc){
        
        delete [SELECT Id from Contact limit 2];
        
    }

}