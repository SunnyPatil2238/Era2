<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page import ="org.springframework.core.io.ResourceLoader" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
<title>Customer</title>
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

<jsp:include page="Header.jsp"></jsp:include>
	<div class="container">
		<c:choose>
			<c:when test="${(mode== 'Cust_View')}">
				<input class="form-control" id="myInput" type="text" placeholder="Search.. (शोधा) 
				">
  				<br>
  				
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Customer Id (ग्राहक आयडी)  </th>
							<th>First Name (नाव)  </th>
							<th>Last Name (आडनाव)  </th>
							<th>Village (गाव)  </th>
							<th>Balance (शिल्लक)  </th>
						</tr>
					</thead>
					
					<tbody id="myTable">
						<c:forEach var="Customer" items="${AllCust}">
							<tr>
							
								<td>${Customer.getCustId()}</td>
								<td>${Customer.getCustFirstName()}</td>
								<td>${Customer.getCustLastName()}</td>
								<td>${Customer.getCustAddress1()}</td>
								<td>${Customer.getCustBalance()}</td>
								<td><a href="custItemVew?id=${Customer.getCustId()}"><span
										class="glyphicon glyphicon-eye-open"></span></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<script>
					$(document)
							.ready(
									function() {
										$("#myInput")
												.on(
														"keyup",
														function() {
															var value = $(this)
																	.val()
																	.toLowerCase();
															$("#myTable tr")
																	.filter(
																			function() {
																				$(
																						this)
																						.toggle(
																								$(
																										this)
																										.text()
																										.toLowerCase()
																										.indexOf(
																												value) > -1)
																			});
														});
									});
				</script>

			</c:when>
			<c:when test="${(mode=='Cust_Mod')}">
				<%-- <c:url var="custmodurl" value="custMod}"></c:url> --%>
				<form action="custMod" method="post">




					<div class="form-group col-lg-12">
						<label for="CustId">Customer ID</label> <input type="text"
							value="${Customer.get().getCustId()}" readonly
							class="form-control" id="CustId" name="CustId" />
					</div>
					
					

					
						<div class="form-group col-lg-6">
							<label for="CustFirstName">First Name (नाव)
							 </label> <input type="text"
								value="${Customer.get().getCustFirstName()}"
								class="form-control" id="CustFirstName" name="CustFirstName" required="required" />
						</div>


						<div class="form-group col-lg-6">
							<label for="CustLastName">Last Name (आडनाव)
							</label> <input type="text"
								value="${Customer.get().getCustLastName()}" class="form-control"
								id="CustLastName" name="CustLastName" />
						</div>
						
					<div class="form-group col-lg-6">
							<label for="CustAddress1">Street and Village (गल्ली आणि गाव)
							</label> <input type="textbox"
								value="${Customer.get().getCustAddress1()}" class="form-control"
								id="CustAddress1" name="CustAddress1" />
						</div>
						
					<div class="form-group col-lg-6">
							<label for="CustAddress2">Landmark (प्रसिद्ध ठिकाण)
							</label> <input type="textbox"
								value="${Customer.get().getCustAddress2()}" class="form-control"
								id="CustAddress2" name="CustAddress2" />
					</div>
						
					<div class="form-group col-lg-12">
							<label for="CustBalance">Balance (शिल्लक)
							</label> <input type="textbox"
								value="${Customer.get().getCustBalance()}" class="form-control"
								id="CustBalance" name="CustBalance" />
					</div>
						
						<div class="form-group col-lg-12">
							<label for="CustCity">City (शहर)
							</label> <input type="textbox"
								value="${Customer.get().getCustCity()}" class="form-control"
								id="CustCity" name="CustCity" />
						</div>
						
						<div class="form-group col-lg-12">
							<label for="CustTelephone">Mobile No. (मोबाइल नंबर)
							 </label> <input type="tel"
								value="${Customer.get().getCustTelephone()}"  
								pattern="[0-9]{10}" title="10 numbers only wihtout alphabets"  
								class="form-control"
								id="CustTelephone" name="CustTelephone" />
						</div>

					<div class="form-group col-lg-12">
						<label for="CustMail">E mail (इ मेल)
						</label> <input type="email"
							value="${Customer.get().getCustMail()}" class="form-control"
							id="CustMail" name="CustMail">
					</div>
					<div class="text-center"> 
					
					<button  type="submit" class="btn btn-default">Submit (जतन करा)
					</button>
					</div>
				</form>
			</c:when>
			
			<c:when test="${(mode=='Cust_Item_Vew')}">
				<%-- <c:url var="custmodurl" value="custMod}"></c:url> --%>
				<form action="/AllCustomer" >




					<div class="form-group col-lg-12">
						<label for="CustId">Customer ID (ग्राहक आयडी )
						</label> <input type="text"
							value="${Customer.get().getCustId()}" readonly
							class="form-control" id="CustId" name="CustId" />
					</div>
					
					

					
						<div class="form-group col-lg-6">
							<label for="CustFirstName">First Name (नाव)
							 </label> <input type="text"
								value="${Customer.get().getCustFirstName()}" readonly
								class="form-control" id="CustFirstName" name="CustFirstName" />
						</div>


						<div class="form-group col-lg-6">
							<label for="CustLastName">Last Name (आडनाव)
							</label> <input type="text"
								value="${Customer.get().getCustLastName()}" readonly class="form-control"
								id="CustLastName" name="CustLastName" />
						</div>
						
					<div class="form-group col-lg-6">
							<label for="CustAddress1">Street and Village (गल्ली आणि गाव)
							 </label> <input type="textbox"
								value="${Customer.get().getCustAddress1()}"  readonly class="form-control"
								id="CustAddress1" name="CustAddress1" />
						</div>
						
					<div class="form-group col-lg-6">
							<label for="CustAddress2">Landmark (प्रसिद्ध ठिकाण)
							</label> <input type="textbox"
								value="${Customer.get().getCustAddress2()}"  readonly class="form-control"
								id="CustAddress2" name="CustAddress2" />
						</div>
						
					<div class="form-group col-lg-12">
							<label for="CustBalance">Balance (शिल्लक)
							</label> <input type="textbox"
								value="${Customer.get().getCustBalance()}" readonly class="form-control"
								id="CustBalance" name="CustBalance" />
					</div>
						
						
						<div class="form-group col-lg-12">
							<label for="CustCity">City (शहर)
							</label> <input type="textbox"
								value="${Customer.get().getCustCity()}"  readonly class="form-control"
								id="CustCity" name="CustCity" />
						</div>
						
						<div class="form-group col-lg-12">
							<label for="CustTelephone">Mobile No. (मोबाइल नंबर)
							</label> <input type="tel"
								value="${Customer.get().getCustTelephone()}" readonly  class="form-control"
								id="CustTelephone" name="CustTelephone" />
						</div>

					<div class="form-group col-lg-12">
						<label for="CustMail">E mail (इ मेल)
						</label> <input type="email"
							value="${Customer.get().getCustMail()}"  readonly class="form-control"
							id="CustMail" name="CustMail">
					</div>
					<div class="text-center">
					<button type="submit" class="btn btn-default">Back (मागे)
					</button>

					<a href="updCust?id=${Customer.get().getCustId()}" class="btn btn-primary btn-md " role="button" aria-pressed="true">Edit (सुधारणे)
					</a>
					<a href="delCust?id=${Customer.get().getCustId()}" class="btn btn-danger btn-md " role="button" aria-pressed="true" onclick="return confirm('Are you sure you want to delete this item (तुम्हाला नक्की डिलीट करायचे आहे का)?');" >Delete (हटवा)
					</a>
					
					</div>
				</form>
				
			</c:when>
			
			<c:when test="${(mode=='Cust_Item_Add')}">
				<%-- <c:url var="custmodurl" value="custMod}"></c:url> --%>
				<form action="custAdd" method="post">




			<%-- 		<div class="form-group col-lg-12">
						<label for="CustId">Customer ID</label> <input type="text"
							value="${Customer.get().getCustId()}" readonly
							class="form-control" id="CustId" name="CustId" />
					</div> --%>
					
					

					
						<div class="form-group col-lg-6">
							<label for="CustFirstName">First Name (नाव)
							</label> <input type="text"
								<%-- value="${Customer.get().getCustFirstName()}" --%>
								class="form-control" id="CustFirstName" name="CustFirstName"  required="required"/>
						</div>


						<div class="form-group col-lg-6">
							<label for="CustLastName">Last Name (आडनाव)
							</label> <input type="text"
								<%-- value="${Customer.get().getCustLastName()}" --%>
								 class="form-control"
								id="CustLastName" name="CustLastName" />
						</div>
						
					<div class="form-group col-lg-4">
							<label for="CustAddress1">Street and Village (गल्ली आणि गाव)
							</label> <input type="textbox"
								<%-- value="${Customer.get().getCustAddress1()}" --%> 
								class="form-control"
								id="CustAddress1" name="CustAddress1" />
						</div>
						
					<div class="form-group col-lg-4">
							<label for="CustAddress2">Landmark (प्रसिद्ध ठिकाण)
							</label> <input type="textbox"
								<%-- value="${Customer.get().getCustAddress2()}" --%>
								 class="form-control"
								id="CustAddress2" name="CustAddress2" />
					</div>
						
						<div class="form-group col-lg-4">
							<label for="CustCity">City (शहर)
							</label> <input type="textbox"
								<%-- value="${Customer.get().getCustCity()}" --%> 
								class="form-control"
								id="CustCity" name="CustCity" value="शहर" />
						</div>
						
								<div class="form-group col-lg-6">
							<label for="CustBalance">Balance (शिल्लक)
							</label> <input type="textbox"
								<%-- value="${Customer.get().getCustBalance()}" --%> 
								class="form-control"
								id="CustBalance" name="CustBalance" />
					</div>
						
						<div class="form-group col-lg-6">
							<label for="CustTelephone">Mobile No. (मोबाइल नंबर)
							</label> <input type="tel"
								<%-- value="${Customer.get().getCustTelephone()}" --%> 
								pattern="[0-9]{10}" title="10 numbers only wihtout alphabets"
								class="form-control"
								id="CustTelephone" name="CustTelephone" />
						</div>

					<div class="form-group col-lg-12">
						<label for="CustMail">E mail (इ मेल)
						</label> <input type="email"
							<%-- value="${Customer.get().getCustMail()}" --%> 
							class="form-control"
							id="CustMail" name="CustMail">
					</div>
					<div class="text-center"> 
					
					
					<button type="submit" class="btn"><i class="fa fa-folder"></i>Submit (जतन करा)</button>
					
					</div>
				</form>
			</c:when>
			
		</c:choose>
	</div>

</body>
</html>
