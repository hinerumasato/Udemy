$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});

	$('button[data-bs-target="#deleteEmployeeModal"]').click(function() {
		const id = this.getAttribute('course-id');
		const softDeleteForm = document.getElementById('softDeleteForm');
		let action = softDeleteForm.getAttribute('action');
		const protocol = window.location.protocol;
		const host = window.location.host;
		const url = new URL(`${protocol}//${host}${action}`);
		const params = new URLSearchParams(url.search);
		params.set('id', id);
		url.search = params.toString();
		// softDeleteForm.method = 'PUT';
		softDeleteForm.action = url.href;
	});
});