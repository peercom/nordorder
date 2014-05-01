$(document).ready(function() {
$("input#cart_confirmed").click(function() {
	$("#submit").attr("disabled", !this.checked);
});
});