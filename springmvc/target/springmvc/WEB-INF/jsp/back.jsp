<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="utf-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
	var backEndArray = new Array();
	<c:forEach items="${ back_end }" var="value" >
	{
		var id = "${value}";
		backEndArray.push(id);
	}
	</c:forEach>
	$(function() {
	   var backEndList = backEndArray;
	   $( "#backEnd" ).autocomplete({
	     source: backEndList
	   });
	 });
 </script>
 
 <div>
  <label for="backEnd">List of Back_End values: </label>
  <input id="backEnd">
</div>
