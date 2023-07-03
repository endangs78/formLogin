/**
 * 
 */
 
 $(function(){
		$('#dob').fdatepicker({
			format: 'dd/mm/yyyy',
		});
	});
	
function passwordValidation()
{
 regexPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
 inputTextVal = document.getElementById("txt");
if(inputTextVal.value.match(regexPattern))
 {
document.getElementById("msg").innerHTML = "Great";
returntrue;
 }
else
 {
document.getElementById("error").innerHTML = "Please follow the proper format";
returnfalse;
 }
}