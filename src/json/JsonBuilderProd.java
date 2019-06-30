package json;

import java.lang.reflect.Type;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;

import beans.ProductBean;

public class JsonBuilderProd implements com.google.gson.JsonSerializer<beans.ProductBean>{

	@Override
	public JsonElement serialize(ProductBean o, Type arg1, JsonSerializationContext arg2) {
		// TODO Auto-generated method stub
		JsonObject obj = new JsonObject();
		
		obj.addProperty("id", o.getCode());
		obj.addProperty("name", o.getName());
		obj.addProperty("img", o.getPhoto());
		obj.addProperty("isinDicount", o.isinDiscount());
		obj.addProperty("price", o.getPriceSenzaSconto().toString());
		obj.addProperty("priceDisc", o.getPricewithIva().toString());
		obj.addProperty("discount", o.getDiscount());
		
		return obj;
	}

}
