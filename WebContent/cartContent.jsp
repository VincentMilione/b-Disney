<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "beans.*, beans.Cart, java.util.Collection" %>

<section class="ftco-section ftco-cart">
<div class="row ">
	<div class="card">
		    <div class="cart-list">
				<table class="table">
				<thead class="thead-primary">
					<tr class="text-center">
						<th>&nbsp;</th>
						<th>&nbsp;</th>
		     			<th>Product</th>
						<th>Price</th>
						<th>Price + Iva</th>
						<th>Quantity</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
<%
Cart cart = (Cart) session.getAttribute("cart");

if (cart == null) {
	%><tr><td style ="text-align: center"  colspan = "7">no Data</td></tr><% 
} else if (cart.size() == 0) {
	%><tr><td style ="text-align: center" colspan = "7">no Data</td></tr><% 
} else {
	Collection<Order> list = cart.getOrders();
	java.util.Iterator<Order> it = list.iterator();
	double cartTotal = cart.getTotal();
	double cartIva = cart.getTotalIva();
	double cartPrice = cart.getTotalWithoutIva();

	while (it.hasNext()) {
		Order o = it.next();
		ProductBean bean = o.getProduct();
		int orderedQty = o.getQty();
		String name = bean.getName();
		double priceUnit = bean.getPriceSenzaSconto();
		double priceWithIva = bean.getPricewithIva();
		double totalProduct = o.getTotal();
		int qtyMax = bean.getQty();
		String urlImage = bean.getPhoto();
	
	%>
					<tr class="text-center">
						<td class="product-remove"><a href="#"><span class="ion-ios-close"></span></a></td>
						<td class="image-prod"><div id="img" style="background-image: url('<%=urlImage%>');"></div> </td>
						<td class="product-name"><h5><%=name%></h5></td>
						<td><h5><%=(Math.round(priceUnit*100))/100.0 %></h5></td>
						<td><h5><%=(Math.round(priceWithIva*100))/100.0%></h5></td>
						<td class="quantity"><div class="input-group mb-3"><h5><input type="number" name="quantity" class="quantity form-control input-number" value="<%=orderedQty%>" min="1" max="<%=qtyMax%>"></h5></div></td>
						<td class="total"><h5><%=totalProduct%></h5></td>
					</tr>
			<%
	}
} 
%>
				</tbody>
				</table>
			</div>
	</div>
  </div>
</section>