package beans;

public class FatturaBean implements java.io.Serializable{

	private static final long serialVersionUID = -7048837643544538726L;
	private java.util.List <beans.Order> prodotti;
	private int cod;
	private java.util.GregorianCalendar date;
	private beans.Adress shipping;
	private Registered user;
	
	public java.util.List<beans.Order> getProdotti() {
		return prodotti;
	}
	public void setProdotti(java.util.List<beans.Order> prodotti) {
		this.prodotti = prodotti;
	}
	public int getCod() {
		return cod;
	}
	public void setCod(int cod) {
		this.cod = cod;
	}
	public java.util.GregorianCalendar getDate() {
		return date;
	}
	public void setDate(java.util.GregorianCalendar date) {
		this.date = date;
	}
	public beans.Adress getShipping() {
		return shipping;
	}
	public void setShipping(beans.Adress shipping) {
		this.shipping = shipping;
	}
	public Registered getUser() {
		return user;
	}
	public void setUser(Registered user) {
		this.user = user;
	}
	public int size () {
		return prodotti.size();
	}
	@Override
	public String toString() {
		return "Dettagli = [cod=" + cod + ", date=" + date + ", shipping=" + shipping + "]"+"\n prodotti=" + prodotti 
				+ ", user=" + user;
	}
}
