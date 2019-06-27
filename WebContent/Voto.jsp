<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = " beans.ProductBean, beans.RecenzioneBean"%>


<span class="heading">${product.getName()}</span>
<!-- checked sta quando la stella è gialla, ci vuole una media -->
<!-- se media uguale a 1 mettere checked solo qui -->
<span class="fa fa-star checked"></span>
<!-- se media uguale a 2 mettere checked fino a qui -->
<span class="fa fa-star checked"></span>
<!-- se media uguale a 3 mettere checked fino a qui -->
<span class="fa fa-star checked"></span>
<!-- se media uguale a 4 mettere checked fino a qui -->
<span class="fa fa-star checked"></span>
<!-- se media uguale a 5 mettere checked fino a qui -->
<span class="fa fa-star"></span>
<hr style="border:3px solid #f1f1f1">

<!-- nel db invece di numeric mettere int da 1 a 5, se non si vuole cambiare eliminare questa parte, da qui a giu -->
<div class="row">
  <div class="side">
    <div>5 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-5"></div>
    </div>
  </div>
  <div class="side voto">
    <div>150</div><!-- dobbiamo fare interrogazione sql e vedere quanti 5 ci sono -->
  </div>
  <div class="side">
    <div>4 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-4"></div>
    </div>
  </div>
  <div class="side voto">
    <div>63</div>
  </div>
  <div class="side">
    <div>3 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-3"></div>
    </div>
  </div>
  <div class="side voto">
    <div>15</div>
  </div>
  <div class="side">
    <div>2 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-2"></div>
    </div>
  </div>
  <div class="side voto">
    <div>6</div>
  </div>
  <div class="side">
    <div>1 star</div>
  </div>
  <div class="middle">
    <div class="bar-container">
      <div class="bar-1"></div>
    </div>
  </div>
  <div class="side voto">
    <div>20</div>
  </div>
</div>
