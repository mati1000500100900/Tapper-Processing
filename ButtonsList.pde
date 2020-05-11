public class ButtonsList extends ArrayList<Button> {

    public Button findByAction(String s){
        for(Button b : this){
            if(b.action.equals(s)) return b;
        }
        return null;
    }

}
