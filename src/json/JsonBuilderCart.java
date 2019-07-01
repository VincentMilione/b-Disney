package json;

import java.lang.reflect.Type;

import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;

import beans.ProductBean;


public class JsonBuilderCart implements com.google.gson.JsonSerializer<beans.Cart> {

	@Override
	public JsonElement serialize(beans.Cart cart, Type arg1, JsonSerializationContext arg2) {
		// TODO Auto-generated method stub
		JsonObject obj = new JsonObject();
		
		obj.addProperty("totIva", cart.getTotalIva().toString());
		obj.addProperty("noIva", cart.getTotalWithoutIva().toString());
		obj.addProperty("tot", cart.getTotal().toString());
		obj.addProperty("size", cart.size());
		obj.add("list", new GsonBuilder().registerTypeAdapter(ProductBean.class, new json.JsonBuilderProd()).create().toJsonTree(cart.getOrders()));
		
		return obj;
	}

}
