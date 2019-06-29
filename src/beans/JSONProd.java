package beans;

import com.google.gson.*;

public class JSONProd {
	public java.util.ArrayList<JsonObject> obj;
	
	public void add (beans.ProductBean o) {
		JsonObject obj = new JsonObject ();
		
		obj.addProperty("id", o.getCode());
		obj.addProperty("name", o.getName());
		obj.addProperty("img", o.getPhoto());
		obj.addProperty("isinDicount", o.isinDiscount());
		obj.addProperty("price", o.getPriceSenzaSconto().toString());
		obj.addProperty("priceDisc", o.getPricewithIva().toString());
		obj.addProperty("discount", o.getDiscount());
		
		this.obj.add(obj);
	}
	
	public JSONProd (java.util.List<beans.ProductBean> list) {
		obj = new java.util.ArrayList<JsonObject> (); 
		
		for (ProductBean o : list) 
			this.add(o);
	}
	
	public String parse () {
		
		return new Gson().toJson(obj);
	}
	
	public JsonObject[] getObjects() {
		return (JsonObject[]) obj.toArray();
	}
} 
