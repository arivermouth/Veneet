<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Veneen lisääminen</title>
</head>
<body>
<form id="tiedot">
	<table>
	<thead>
		<tr>
			<th colspan="7" class="oikealle"><span id="takaisin">Takaisin listaukseen</span></th>
		</tr>
		<tr>
			<th>Tunnus</th>
			<th>Nimi</th>
			<th>Merkkimalli</th>
			<th>Pituus</th>
			<th>Leveys</th>
			<th>Hinta</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type="text" name="tunnus" id="tunnus"></td>
			<td><input type="text" name="nimi" id="nimi"></td>
			<td><input type="text" name="merkkimalli" id="merkkimalli"></td>
			<td><input type="text" name="pituus" id="pituus"></td>
			<td><input type="text" name="leveys" id="leveys"></td>
			<td><input type="text" name="hinta" id="hinta"></td>  
			<td><input type="submit" id="tallenna" value="Lisää"></td>
		</tr>
	</tbody>
</table>
</form>
<span id="ilmo"></span>
<script>
$(document).ready(function(){
	$("#takaisin").click(function(){
		document.location="listaaveneet.jsp";
	});
	
	$("#tiedot").validate({						
		rules: {
			tunnus:  {
				required: true,				
				number: 2				
			},	
			nimi:  {
				required: true				
			},
			merkkimalli:  {
				required: true
			},	
			pituus:  {
				required: true,
				number: true
			},
			leveys:  {
				required: true,
				number: true
			},	
			hinta:  {
				required: true,
				number: true				
			}
		},
		messages: {
			tunnus: {     
				required: "Puuttuu",				
				number: "Ei kelpaa"			
			},
			nimi: {
				required: "Puuttuu"				
			},
			merkkimalli: {
				required: "Puuttuu"
			},
			pituus: {
				required: "Puuttuu",
				number: "Ei kelpaa"
			},
			leveys: {
				required: "Puuttuu",
				number: "Ei kelpaa"
			},
			hinta: {
				required: "Puuttuu",
				number: "Ei kelpaa"
			}
		},			
		submitHandler: function(form) {	
			lisaaTiedot();
		}		
	}); 
	
	$("#tunnus").focus(); 
});

function lisaaTiedot(){
	var formJsonStr = formDataJsonStr($("#tiedot").serializeArray());
	console.log(formJsonStr);
	$.ajax({url:"veneet", data:formJsonStr, type:"POST", dataType:"json", success:function(result) {     
		if(result.response==0){
        	$("#ilmo").html("Veneen lisääminen epäonnistui.");
        }else if(result.response==1){			
        	$("#ilmo").html("Veneen lisääminen onnistui.");
        	$("#tunnus, #nimi, #merkkimalli, #pituus, #leveys, #hinta").val("");
		}
    }});	
}

function formDataJsonStr(formArray) {
	var returnArray = {};
	for (var i = 0; i < formArray.length; i++){
		returnArray[formArray[i]['name']] = formArray[i]['value'];
	}
	return JSON.stringify(returnArray);
}
</script>
</body>
</html>