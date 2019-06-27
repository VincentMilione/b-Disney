package beans;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = -2354351386783422715L;
	private int qty;
	private int code;
	private String photo;
	private String name; 
	private String description;
	private String character;
	private String tipo;
	private int category;
	private double iva;
	private double discount;
	private double price;
	
	public ProductBean (int id) {
		code = id;
	}
	
	public ProductBean () {
		
	}

	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCharacter() {
		return character;
	}
	public void setCharacter(String character) {
		this.character = character;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public double getIva() {
		return iva;
	}

	public void setIva(double iva) {
		this.iva = iva;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double d) {
		this.price = d;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int quantity) {
		this.qty = quantity;
	}
	
	/*------ utilities -------*/
	
	/**
	 * la funzione controlla se il prodotto � in sconto
	 * @return true � in sconto : false non � in sconto
	 */
	public boolean isinDiscount() {
		return discount > 0;
	}
	
	/**
	 * la funzione fa il calcolo dell'iva da applicare sul prodotto
	 * @return double iva
	 */
	public double calculateIva () {
		return Math.round(iva*price)/100.0;
	}
	
	/**
	 * ritorna il prezzo senza sconti applicati
	 * @return prezzo + iva
	 */
	public double getPriceSenzaSconto () {
		return Math.round((calculateIva() + price) * 100)/100.0;
	}
	
	public double getPriceSenzaIva () {
		return isinDiscount () ? price - price * (discount/100) : price;
	}
	/**
	 * ritorna il prezzo unitario completo (iva + prezzo) tenendo conto se � stato o meno applicato uno sconto
	 * @return 
	 */
	
	public double getPricewithIva () {
		return isinDiscount() ?	Math.round((price + calculateIva () - (discount/100)*(calculateIva() + price))*100)/100.0  : getPriceSenzaSconto();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + code;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductBean other = (ProductBean) obj;
		if (code != other.code)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ProductBean [qty=" + qty + ", code=" + code + ", photo=" + photo + ", name=" + name + ", description="
				+ description + ", character=" + character + ", tipo=" + tipo + ", category=" + category + ", iva="
				+ iva + ", discount=" + discount + ", price=" + price + "]";
	}
}
