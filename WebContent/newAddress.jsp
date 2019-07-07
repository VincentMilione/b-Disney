<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <br> <button id="toggle" class="button button2">Aggiungi indirizzo</button><br>
	         <div id="AddIndirizzo"><br>
	        	  <label  class="myLabel" for="adr"><i class="fa fa-address-card-o"></i> Indirizzo</label>
            	  <input class="myInput1" type="text"  id="adr" name="address" placeholder="via della repubblica">
            	  <div id= "AddressWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong> Il valore non è un indirizzo</div>
            	  
            	  <label  class="myLabel" for="adr"><i class="fa fa-address-card-o"></i> Numero civico</label>
            	  <input class="myInput1" type="number"  id="nc" name="nc" min="1" ><br>
            	 
            	  <label class="myLabel" for="city"><i class="fa fa-institution"></i> Città</label>
                  <input class="myInput1" type="text"  id="city" name="city" placeholder="Roma">
                  <div id= "cityWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong> Il valore non è una citt&agrave</div>
            	  
                  <label  class="myLabel" for="city"><i class="fa fa-institution"></i> Provincia</label>
                  <input class="myInput1" type="text"  id="provincia" name="provincia" placeholder="Roma">
                  <div id= "provinciaWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong> Il valore non è una Provincia</div>
            	  
                  <label  class="myLabel" for="adr"><i class="fa fa-address-card-o"></i> CAP</label>
            	  <input class="myInput1" type="number" id="CAP"  name="CAP" placeholder="80890">
            	  <div id= "capWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong> Il valore non è un CAP</div>
            	  
                  <label  class="myLabel" for="state">Stato</label>
                  <input class="myInput1" type="text" id="state" name="state"  placeholder="Italia">
                  <div id= "statoWarning" class="alert"><span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> <strong>Errore!</strong> Il valore non è uno stato</div>
            	  
                  <button id="butt" class="button button2">Aggiungi</button>
              </div><br>