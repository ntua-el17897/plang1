public class Stack implements Worklist {
	private Node top = null;
	// protected Node top = null; 

	public void add (String data) {
		top = new Node(data, top);
	}
	public boolena hasMore(){
		return (top!=null);
	}

	public String remove(){
		Node n = top;
		top = n.getLink();
		return n.getData();
	}
}

public class PeekableStack extends Stack {
	/**
	* Αυτό δουλεύει γιατί τα private στοιχεία της κλάσης που κάνει extend δεν είναι διαθέσιμα στην παρούσα κλάση. Οπότε πρέπει να αλλάξουμε την υλοποιήση της κλάσης Stack και να γίνει protected ώστε να είναι διαθέσιμο στις κληρωνόμους της κλάσης
	*/
	public String peek(){
		String s = remove();
		add(s);
		return s; 
	}
}

public class Graphic {
	protected int x, y;
	protected int width, height;
	public void move(int newX, int newY){
		x = newX;
		y = newY;
	}
}

public class Label extends Graphic{
	private String text;
	public String getText(){
		return text;
	}
}

public class Icon extends Graphic{
	private Gif image;
	piblic Gif getImage(){
		return image;
	}
}


