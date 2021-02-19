<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>Product</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<script>
window.onkeyup = function(e) {
  if (e.keyCode == 27) window.history.back();
}
</script>
<script>

function createTable(){

	var pur_p=document.getElementById("Purchase_Price").value;
	var Qty=document.getElementById("Qty").value;
	var measure="";
	var table=document.getElementById('tblData'); 
	var rowCount = table.rows.length;
	
	for (var x=rowCount-1; x>0; x--) {
   		table.deleteRow(x);
		}
	
	if (document.getElementById('Kg').checked) 
	{
  measure = document.getElementById('Kg').value;
	}else{
	measure = document.getElementById('Gram').value;
	}
	if(measure=='Kg')
	{
	var row = table.insertRow(1);
    var cell0 = row.insertCell(0);  
    cell0.innerHTML = "10KG";
    var cell0 = row.insertCell(1);  
    cell0.innerHTML = ((Number(pur_p)/Number(Qty))*10).toFixed(3);
	
	var row = table.insertRow(2);
    var cell0 = row.insertCell(0);  
    cell0.innerHTML = "5KG";
    var cell0 = row.insertCell(1);  
    cell0.innerHTML = ((Number(pur_p)/Number(Qty))*5).toFixed(3);
	
	var row = table.insertRow(3);
    var cell0 = row.insertCell(0);  
    cell0.innerHTML = "1KG";
    var cell0 = row.insertCell(1);  
    cell0.innerHTML = (Number(pur_p)/Number(Qty)).toFixed(3);
	
	var row = table.insertRow(4);
    var cell0 = row.insertCell(0);  
    cell0.innerHTML = "500gm";
    var cell0 = row.insertCell(1);  
    cell0.innerHTML = ((Number(pur_p)/Number(Qty))/2).toFixed(3);
	
	var row = table.insertRow(5);
    var cell0 = row.insertCell(0);  
    cell0.innerHTML = "250gm";
    var cell0 = row.insertCell(1);  
    cell0.innerHTML = ((Number(pur_p)/Number(Qty))/4).toFixed(3);
	
	var row = table.insertRow(6);
    var cell0 = row.insertCell(0);  
    cell0.innerHTML = "100gm";
    var cell0 = row.insertCell(1);  
    cell0.innerHTML = ((Number(pur_p)/Number(Qty))/10).toFixed(3);
    
    var row = table.insertRow(7);
    var cell0 = row.insertCell(0);  
    cell0.innerHTML = "50gm";
    var cell0 = row.insertCell(1);  
    cell0.innerHTML = ((Number(pur_p)/Number(Qty))/20).toFixed(3);
    
    var row = table.insertRow(8);
    var cell0 = row.insertCell(0);  
    cell0.innerHTML = "25gm";
    var cell0 = row.insertCell(1);  
    cell0.innerHTML = ((Number(pur_p)/Number(Qty))/40).toFixed(3);
    
    var row = table.insertRow(9);
    var cell0 = row.insertCell(0);  
    cell0.innerHTML = "10gm";
    var cell0 = row.insertCell(1);  
    cell0.innerHTML = ((Number(pur_p)/Number(Qty))/100).toFixed(3);
    
    var row = table.insertRow(10);
    var cell0 = row.insertCell(0);  
    cell0.innerHTML = "5gm";
    var cell0 = row.insertCell(1);  
    cell0.innerHTML = ((Number(pur_p)/Number(Qty))/200).toFixed(3);
    }else{
    
    		var row = table.insertRow(1);
		var cell0 = row.insertCell(0);  
		cell0.innerHTML = "10KG";
		var cell0 = row.insertCell(1);  
		cell0.innerHTML = ((Number(pur_p)/(Number(Qty)/1000))*10).toFixed(3);
		
		var row = table.insertRow(2);
		var cell0 = row.insertCell(0);  
		cell0.innerHTML = "5KG";
		var cell0 = row.insertCell(1);  
		cell0.innerHTML = ((Number(pur_p)/(Number(Qty)/1000))*5).toFixed(3);
		
		var row = table.insertRow(3);
		var cell0 = row.insertCell(0);  
		cell0.innerHTML = "1KG";
		var cell0 = row.insertCell(1);  
		cell0.innerHTML = (Number(pur_p)/(Number(Qty)/1000)).toFixed(3);
		
		var row = table.insertRow(4);
		var cell0 = row.insertCell(0);  
		cell0.innerHTML = "500gm";
		var cell0 = row.insertCell(1);  
		cell0.innerHTML = ((Number(pur_p)/(Number(Qty)/1000))/2).toFixed(3);
		
		var row = table.insertRow(5);
		var cell0 = row.insertCell(0);  
		cell0.innerHTML = "250gm";
		var cell0 = row.insertCell(1);  
		cell0.innerHTML = ((Number(pur_p)/(Number(Qty)/1000))/4).toFixed(3);
		
		var row = table.insertRow(6);
		var cell0 = row.insertCell(0);  
		cell0.innerHTML = "100gm";
		var cell0 = row.insertCell(1);  
		cell0.innerHTML = ((Number(pur_p)/(Number(Qty)/1000))/10).toFixed(3);
		
		var row = table.insertRow(7);
		var cell0 = row.insertCell(0);  
		cell0.innerHTML = "50gm";
		var cell0 = row.insertCell(1);  
		cell0.innerHTML = ((Number(pur_p)/(Number(Qty)/1000))/20).toFixed(3);
		
		var row = table.insertRow(8);
		var cell0 = row.insertCell(0);  
		cell0.innerHTML = "25gm";
		var cell0 = row.insertCell(1);  
		cell0.innerHTML = ((Number(pur_p)/(Number(Qty)/1000))/40).toFixed(3);
		
		var row = table.insertRow(9);
		var cell0 = row.insertCell(0);  
		cell0.innerHTML = "10gm";
		var cell0 = row.insertCell(1);  
		cell0.innerHTML = ((Number(pur_p)/(Number(Qty)/1000))/100).toFixed(3);
		
		var row = table.insertRow(10);
		var cell0 = row.insertCell(0);  
		cell0.innerHTML = "5gm";
		var cell0 = row.insertCell(1);  
		cell0.innerHTML = ((Number(pur_p)/(Number(Qty)/1000))/200).toFixed(3);
		
        
    
    
    }
	//alert("Purchase Price: "+pur_p+" Qty : "+Qty+ " Measure: "+measure);
	
}
</script>


<jsp:include page="Header.jsp"></jsp:include>

<form action="javascript:createTable();">
<div class="form-group col-lg-3">
							<label for="Purchase_Price" class="fa fa-rupee">Purchase Price (खरेदी किंमत) </label> <input type="number" step ="any"
								}"
								required="required" class="form-control" id="Purchase_Price" name="Purchase_Price"  />
					</div>
<div class="form-group col-lg-3">
							<label for="Qty" >Quantity (संख्या) </label> <input type="number" step ="any"
								}"
								required="required" class="form-control" id="Qty" name="Qty"  />
					</div>
					
<div class="form-check">
  <input class="form-check-input" type="radio" name="measure" id="Kg" value="Kg" checked>
  <label class="form-check-label" for="Kg">
    Kg
  </label>
</div>
<div class="form-check">
  <input class="form-check-input" type="radio" name="measure" id="Gram" value="Gram">
  <label class="form-check-label" for="Gram">
    Gram
  </label>
</div>
<br>
					<button type="submit" class="btn">Submit</button>
					
					
<table id="tblData" name="tblData"  class="table table-hover" align='center'>
  <thead>
    <tr>
      <th scope="col">संख्या</th>
      <th scope="col">किंमत</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
  
</table>
	
</body>
</html>