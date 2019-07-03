<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <br> <button id="toggle" class="button button2">Aggiungi indirizzo</button><br>
	         <div id="AddIndirizzo"><br>
	        	  <label  class="myLabel" for="adr"><i class="fa fa-address-card-o"></i> Indirizzo</label>
            	  <input class="myInput1" type="text"  id="adr" name="address" placeholder="via della repubblica">
            	  <label  class="myLabel" for="adr"><i class="fa fa-address-card-o"></i> Numero civico</label>
            	  <input class="myInput1" type="number"  id="nc" name="nc" min="1" ><br>
            	  <label class="myLabel" for="city"><i class="fa fa-institution"></i> Città</label>
                  <input class="myInput1" type="text"  id="city" name="city" placeholder="Roma">
                  <label  class="myLabel" for="city"><i class="fa fa-institution"></i> Provincia</label>
                  <input class="myInput1" type="text"  id="provincia" name="provincia" placeholder="Roma">
                  <label  class="myLabel" for="adr"><i class="fa fa-address-card-o"></i> CAP</label>
            	  <input class="myInput1" type="text" id="CAP"  name="CAP" placeholder="8089">
                  <label  class="myLabel" for="state">Stato</label>
                  <input class="myInput1" type="text" id="state" name="state"  placeholder="Italia">
                  <button id="butt" class="button button2">Aggiungi</button>
              </div><br>