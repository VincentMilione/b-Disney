package Exceptions;

public class NotEnoughAmount extends Exception {

	private static final long serialVersionUID = 4238496385218786647L;

	public NotEnoughAmount() {
		super("Scusate il disagio, ma al momento non abbiamo questa quantità a disposizione");
	}
}
