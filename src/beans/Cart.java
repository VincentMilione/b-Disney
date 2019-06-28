package beans;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart implements Serializable {

	private static final long serialVersionUID = 572202513877133735L;
	private Map<Integer, Order> products;
	
	public Cart() {
		products = new HashMap<Integer, Order>();
	}
	
	public void addOrder (Order o) {
		products.put(o.getProduct().getCode(), o);
	}
	
	public void deleteProduct(int id) {
		products.remove(id);
	}
	
	public Order getOrder (int code) {
		return products.get(code);
	}
	
	public java.util.ArrayList<Order> getOrders() {
		return new java.util.ArrayList <Order>(products.values());
	}
	
	public int [] getCodes () {
		java.util.Set<Integer> set = products.keySet();
		return set.stream().mapToInt(Integer::intValue).toArray();
	}
	
	/*---- utilities -----*/
	
	public double getTotal () {
		double total = 0;
		Collection<Order> list = products.values();
		
		for (Order o : list) {
			beans.ProductBean item = o.getProduct();
			
			total = total + o.getQty()*(item.getPricewithIva());
		}
		
		return Math.round(total * 100)/100.0;
	}
	
	public double getTotalWithoutIva () {
		double total = 0;
		Collection<Order> list = products.values();
		
		for (Order o : list) {
			beans.ProductBean item = o.getProduct();
			
			total = total + o.getQty() * (item.getPriceSenzaIva());
		}
		
		return Math.round(total * 100)/100.0;
	}
	
	public double getTotalIva () {
		double total = 0;
		Collection<Order> list = products.values();
		
		for (Order o : list) {
			beans.ProductBean item = o.getProduct();
			
			total = total + o.getQty()*(item.calculateIva());
		}
		
		return Math.round(total * 100)/100.0;
	}
	
	public int size () {
		return products.size();
	}

	public boolean isEmpty() {
		// TODO Auto-generated method stub
		return products.isEmpty();
	}
}
