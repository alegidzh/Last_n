package math;

public class Numeric {
    public boolean isNumeric(String string){
        boolean numeric = true;
        try {
            int num = Integer.parseInt(string);
        } catch (NumberFormatException e) {
            numeric = false;
        }
        return numeric;
    }
}
