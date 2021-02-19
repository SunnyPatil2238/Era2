<%@page import="com.example.Era.service.ProductService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap,com.example.Era.model.Product" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Billing</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js">  </script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
function calcReturn()
{
	var CashReceived= document.getElementById("CashReceived").value;
	var Buying=document.getElementById("Buying").value;
	
	
	
	
	document.getElementById("return").value=Number(CashReceived)-Number(Buying);
	if(document.getElementById("return").value<0)
		{
		alert("दिलेली रक्कम बिलापेक्षा रुपये "+Math.abs(document.getElementById("return").value)+" ने कमी आहे");
		}
	
}

function fndiscount()
{
	var cashdiscount=document.getElementById("cashdiscount").value;
	var buy=document.getElementById("Buying").value;
	document.getElementById("Buying").value=Number(buy)-Number(cashdiscount);
	
}

function printData()
{
	//tableToJson();
	/*$.ajax({
            url: "/saveBill",
			//url: "/ProjectEra-0.0.1-SNAPSHOT/BillingRestBarCode?id="+myInputBarcode,
            type: "GET",

            contentType: 'application/json; charset=utf-8',
            success: function(resultData) {
              console.log(resultData);
             
            },
            error : function(jqXHR, textStatus, errorThrown) {
            },

            timeout: 120000,
        });
	*/
   var divToPrint=document.getElementById("tblData");
   var header ="<h2 align='center'>A Mart</h2><h4 align='center'>Omkar Amate</h4><h4 align='center'>Kothali , 9096800906 </h4>";
   var MRP=document.getElementById("MRP").value;
   var Buying=document.getElementById("Buying").value;
   var save=document.getElementById("save").value;
   var CashReceived= document.getElementById("CashReceived").value;
   var CashReturn= document.getElementById("return").value;
   var cashdiscount=document.getElementById("cashdiscount").value;
   
   
   newWin= window.open("<html style='width: 40%; height: 40%;'>");
   
   newWin.document.write(header);
   newWin.document.write(divToPrint.outerHTML);
   newWin.document.write("<center><br> <b>एकूण बिल: "+Buying)
   
   if(Number(cashdiscount)>0)
	   {
	   newWin.document.write("</b><Br/><h4 align='center'>सूट दिलेली रक्कम  : "+cashdiscount+ "<br/> </h4>");
	   }
   if(Number(save)>0)
	   {
   		newWin.document.write("</b><Br/><h4 align='center'>एकूण बिल रक्कम : "+MRP+ "<br/> एकूण बचत : "+save+"</h4>");
	   }
   
   
   		if(Number(CashReceived)>0)
	   		{
   			newWin.document.write("<h5 align='center'>दिलेली रक्कम : "+CashReceived+ " परत करायची रक्कम : "+CashReturn+"</h5>");
	   		}
   		
   newWin.document.write("<br/>धन्यवाद ! पुन्हा भेट द्या ... </center>");
   newWin.document.write("</html>");
   newWin.print();
   newWin.close();
  
}

function plusItem(src){
	
	var Mrp=document.getElementById('MRP').value;
	var Buying=document.getElementById('Buying').value;
	var save=document.getElementById('save').value;
	
	 var oRow = src.parentNode.parentNode.rowIndex;
	 document.getElementById("tblData").rows[oRow].cells[4].innerHTML=Number(document.getElementById("tblData").rows[oRow].cells[4].innerHTML)+1;
	 martprice=Number(document.getElementById("tblData").rows[oRow].cells[3].innerHTML);
	 document.getElementById("tblData").rows[oRow].cells[5].innerHTML=Number(document.getElementById("tblData").rows[oRow].cells[5].innerHTML)+martprice;

	 document.getElementById('MRP').value=Number(document.getElementById('MRP').value)+Number(document.getElementById("tblData").rows[oRow].cells[2].innerHTML);
	 document.getElementById('Buying').value=Number(document.getElementById('Buying').value)+Number(document.getElementById("tblData").rows[oRow].cells[3].innerHTML);
	 
	 document.getElementById('save').value=Number(document.getElementById('save').value)+(Number(document.getElementById("tblData").rows[oRow].cells[2].innerHTML))-(Number(document.getElementById("tblData").rows[oRow].cells[3].innerHTML));
	 
}

function minusItem(src){
	 var oRow = src.parentNode.parentNode.rowIndex;
	 var Mrp=document.getElementById('MRP').value;
	 var Buying=document.getElementById('Buying').value;
	 var save=document.getElementById('save').value;
		
	 if(Number(document.getElementById("tblData").rows[oRow].cells[4].innerHTML)>1)
	 {  
		 document.getElementById("tblData").rows[oRow].cells[4].innerHTML=Number(document.getElementById("tblData").rows[oRow].cells[4].innerHTML)-1;
		 martprice=Number(document.getElementById("tblData").rows[oRow].cells[3].innerHTML);
	 	 document.getElementById("tblData").rows[oRow].cells[5].innerHTML=Number(document.getElementById("tblData").rows[oRow].cells[5].innerHTML)-martprice;
	 	 
	 	 document.getElementById('MRP').value=Number(document.getElementById('MRP').value)-Number(document.getElementById("tblData").rows[oRow].cells[2].innerHTML);
	 	document.getElementById('Buying').value=Number(document.getElementById('Buying').value)-Number(document.getElementById("tblData").rows[oRow].cells[3].innerHTML);
	 	document.getElementById('save').value=Number(document.getElementById('save').value)-((Number(document.getElementById("tblData").rows[oRow].cells[2].innerHTML))-(Number(document.getElementById("tblData").rows[oRow].cells[3].innerHTML)));
	 }
}

function deleteItem(src){
	 var oRow = src.parentNode.parentNode.rowIndex;
	 var Mrp=document.getElementById('MRP').value;
	 var Buying=document.getElementById('Buying').value;
	 var save=document.getElementById('save').value;
		
	 TQty=Number(document.getElementById("tblData").rows[oRow].cells[4].innerHTML);
	 TMrp=Number(document.getElementById("tblData").rows[oRow].cells[2].innerHTML);
	 Tprice=Number(document.getElementById("tblData").rows[oRow].cells[3].innerHTML);
	 TDiff=TMrp-Tprice;
	 
	 
	 document.getElementById('MRP').value=Number(document.getElementById('MRP').value)-(TMrp*TQty);
	 document.getElementById('Buying').value=Number(document.getElementById('Buying').value)-(Tprice*TQty);
	 document.getElementById('save').value=Number(document.getElementById('save').value)-(TDiff*TQty)
	 
	 
		
	 
	 document.getElementById("tblData").deleteRow(oRow);
}




function addRowBarcode(tblData,myInputBarcode,field)
{
	var Mrp=document.getElementById('MRP').value;
	var Buying=document.getElementById('Buying').value;
	var save=document.getElementById('save').value;
	
	
	document.getElementById(field).value="";
	var table=document.getElementById(tblData); 
	var rowCount = table.rows.length;
	sumMrpVal = 0;
	sumbuyingVal = 0;
	
	
	jQuery.ajax({
            //url: "/BillingRestBarCode?id="+myInputBarcode,
			url: "/ProjectEra-0.0.1-SNAPSHOT/BillingRestBarCode?id="+myInputBarcode,
            type: "GET",

            contentType: 'application/json; charset=utf-8',
            success: function(resultData) {
              console.log(resultData[myInputBarcode]);
              
            	
              if(resultData[myInputBarcode])
          	{
          	
            	var row = table.insertRow(rowCount);
            	var cell0 = row.insertCell(0);  
            	        cell0.innerHTML = resultData[myInputBarcode].productId;
            	
            	 cell0 = row.insertCell(1);  
            	        cell0.innerHTML = resultData[myInputBarcode].productName;
            	
            	 cell0 = row.insertCell(2);  
            	        cell0.innerHTML = resultData[myInputBarcode].productMRP;
            	
            	 cell0 = row.insertCell(3);  
            	        cell0.innerHTML = resultData[myInputBarcode].productSellingPrice;
            	    
            	        cell0 = row.insertCell(4);  
            	        cell0.innerHTML = 1
            	
            	        cell0 = row.insertCell(5);  
            	        cell0.innerHTML = resultData[myInputBarcode].productSellingPrice;
            	    
            	        
            	        cell0 = row.insertCell(6);  
            	        cell0.innerHTML = '<a href=# onclick="javascript:plusItem(this)" ><span class="glyphicon glyphicon-plus"></span>';
            	        
            	        cell0 = row.insertCell(7);  
            	        cell0.innerHTML = '<a href=# onclick="javascript:minusItem(this)" ><span class="glyphicon glyphicon-minus"></span>';
            	        
            	        cell0 = row.insertCell(8);  
            	        cell0.innerHTML = '<a href=# onclick="javascript:deleteItem(this)" ><span class="glyphicon glyphicon-trash"></span>';
            	 
            	        if(Number.isNaN(parseInt(Mrp)))
            	        	Mrp=0;
            	        if(Number.isNaN(parseInt(Buying)))
            	        	Buying=0;
            	        if(Number.isNaN(parseInt(save)))
            	        	save=0;
            	        
            	        document.getElementById('MRP').value=Number(resultData[myInputBarcode].productMRP)+Number(Mrp);
            	        document.getElementById('Buying').value=Number(resultData[myInputBarcode].productSellingPrice)+Number(Buying);
            	        document.getElementById('save').value=((Number(resultData[myInputBarcode].productMRP)+Number(Mrp))-(Number(resultData[myInputBarcode].productSellingPrice)+Number(Buying)));
          	}else
          		{
          		alert("ह्या बारकोड ला कोणतीही वस्तू लिंक नाही")
          		}

            },
            error : function(jqXHR, textStatus, errorThrown) {
            },

            timeout: 120000,
        });
	 



	        		
	
}


function addRowId(tblData,myInputId,field)
{
	
	document.getElementById(field).value="";
	
	var Mrp=document.getElementById('MRP').value;
	var Buying=document.getElementById('Buying').value;
	var save=document.getElementById('save').value;
	
	var table=document.getElementById(tblData); 
	var rowCount = table.rows.length;
	sumMrpVal = 0;
	sumbuyingVal = 0;
	
	
	jQuery.ajax({
           // url: "/BillingRestId?id="+myInputId,
           url: "/ProjectEra-0.0.1-SNAPSHOT/BillingRestId?id="+myInputId,            		
          
            type: "GET",

            contentType: 'application/json; charset=utf-8',
            success: function(resultData) {
              console.log(resultData[myInputId]);
              
            	if(resultData[myInputId])
            	{
            	
            	var row = table.insertRow(rowCount);
            	var cell0 = row.insertCell(0);  
            	        cell0.innerHTML = resultData[myInputId].productId;
            	        

            	 cell0 = row.insertCell(1);  
            	        cell0.innerHTML = resultData[myInputId].productName;
            	     
            	 cell0 = row.insertCell(2);  
            	        cell0.innerHTML = resultData[myInputId].productMRP;
            	     
            	 cell0 = row.insertCell(3);  
            	        cell0.innerHTML = resultData[myInputId].productSellingPrice;
            	     
            	        cell0 = row.insertCell(4);  
            	        cell0.innerHTML = 1
            	        cell0.id='QtyId';
            	        
            	        cell0 = row.insertCell(5);  
            	        cell0.innerHTML = resultData[myInputId].productSellingPrice;
            	     
            	        cell0 = row.insertCell(6);  
            	        cell0.innerHTML = '<a href=# onclick="javascript:plusItem(this)" ><span class="glyphicon glyphicon-plus"></span>';
            	        
            	        cell0 = row.insertCell(7);  
            	        cell0.innerHTML = '<a href=# onclick="javascript:minusItem(this)" ><span class="glyphicon glyphicon-minus"></span>';
            	        
            	        cell0 = row.insertCell(8);  
            	        cell0.innerHTML  = '<a href=# onclick="deleteItem(this);" ><span class="glyphicon glyphicon-trash"></span>';
            	        
            	        if(Number.isNaN(parseInt(Mrp)))
            	        	Mrp=0;
            	        if(Number.isNaN(parseInt(Buying)))
            	        	Buying=0;
            	        if(Number.isNaN(parseInt(save)))
            	        	save=0;
            	        
            	        document.getElementById('MRP').value=Number(resultData[myInputId].productMRP)+Number(Mrp);
            	        document.getElementById('Buying').value=Number(resultData[myInputId].productSellingPrice)+Number(Buying);
            	        document.getElementById('save').value=((Number(resultData[myInputId].productMRP)+Number(Mrp))-(Number(resultData[myInputId].productSellingPrice)+Number(Buying)));
            	}
            	else{
            		alert("ह्या आईडी ला कोणतीही वस्तू लिंक नाही");
            	}
            	        
            },
            error : function(jqXHR, textStatus, errorThrown) {
            },

            timeout: 120000,
        });
	 



	        		
	
}



</Script>
</head>
</head>
<body >

<jsp:include page="Header.jsp"></jsp:include>
<div class="form-group col-lg-6">
<input class="form-control" id="myInputBarcode" type="text" onchange="addRowBarcode('tblData',this.value,'myInputBarcode'); " placeholder="Barcode (बारकोड) "></div>
<div class="form-group col-lg-6">
<input class="form-control" id="myInputId" type="text" onchange="addRowId('tblData',this.value,'myInputId'); " placeholder="Id (आयडी) "></div>
  				</br>


<table id="tblData" name="tblData"  class="table table-hover" align='center'>
  <thead>
    <tr>
      <th scope="col">आयडी</th>
      <th scope="col">नाव</th>
      <th scope="col">रकम</th>
      <th scope="col">ए मार्ट रक्कम</th>
      <th scope="col">नग</th>
      <th scope="col">एकूण</th>
    </tr>
  </thead>
  <tbody>
  </tbody>
  
</table>

एकूण बिल रक्कम : <input type="text" align='center' maxlength="5" readonly="readonly" id='MRP' name='MRP' style="border: none;"/>
A मार्ट बिल रक्कम : <input type="text" align='center' maxlength="5" readonly="readonly" id='Buying' name='Buying' style="border: none;"/>
एकूण बचत :<input type="text" maxlength="5" align='center' readonly="readonly" id='save' name='save' style="border: none;"/>
परत करायची रक्कम :<input type="number" maxlength="5" align='center' readonly="readonly" id='return' name='return' style="border: none;"/>
<br/>
<br/>
दिलेली रक्कम :  <input type="number" maxlength="5" align='center' id='CashReceived' name='CashReceived' onchange=calcReturn()>

सूट :  <input type="number" maxlength="5" align='center' id='cashdiscount' name='cashdiscount' onchange=fndiscount()>

<div align='center'>
  				<button type="button" onclick="printData();">प्रिंट</button>
</div>


</body>
</html>