<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
	var frontEndArray = new Array();
	<c:forEach items="${ front_end }" var="value" >
	{
		var id = "${value}";
		frontEndArray.push(id);
	}
	</c:forEach>

	$(function() {
		var frontEndList = frontEndArray;
		$("#frontEnd").autocomplete({
			source : frontEndList
		});
	});

	$(document).ready(function() {
		$('.results').hide();
	});

	function perform_submitter_search() {
		$.ajax({
			type : 'POST',
			url : "front.html",
			success : function(text) {
				$('.results').show();
				$('.results').html(text);
				$('.ui-widget').hide();
				$('.button_class').hide();
			}
		});
	}

</script>
</head>
<body>

	<div class="ui-widget">
		<label for="frontEnd">Initial Load of the page with Front_End values: </label> <input id="frontEnd">
	</div>
	</br>
	<input class="button_class" type="button"
		onclick="perform_submitter_search();" value="Get the Back_End values from the Web Service Call" />

	<div class="results">
	</div>

</body>
</html>