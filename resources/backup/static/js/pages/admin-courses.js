$(document).ready(function(){
	const restoreAllBtn = document.getElementById('restoreAllBtn');
	const softDeleteAllBtn = document.getElementById('softDeleteAllBtn');
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

	const sumbitFormHandler = (ids, formSelector) => {
		const form = document.querySelector(formSelector);
		let action = form.getAttribute('action');
		const protocol = window.location.protocol;
		const host = window.location.host;
		const url = new URL(`${protocol}//${host}${action}`);
		const params = new URLSearchParams(url.search);
		params.set('id', ids);
		url.search = params.toString();

		const href = url.href;
		const path = href.split(`${protocol}//${host}`)[1];
		form.action = path;
	}

	$('.soft-delete-btn').click(function() {
		sumbitFormHandler(this.getAttribute('course-id'), '#softDeleteForm');
	});

	$('.restore-btn').click(function () {
		sumbitFormHandler(this.getAttribute('course-id'),'#restoreCourseForm');
	});

	/**
	 * @returns {Array} array of checked checkbox
	 */
	const getAllChecked = () => {
		const checkboxs = document.querySelectorAll('table tbody input[type="checkbox"]');
		return Array.from(checkboxs).filter(checkbox => checkbox.checked);
	}

	if(restoreAllBtn) {
		restoreAllBtn.onclick = e => {
			const checkboxs = getAllChecked();
			const ids = checkboxs.map(checkbox => checkbox.value);
			sumbitFormHandler(ids, '#restoreCourseForm');
		}
	}

	if(softDeleteAllBtn) {
		softDeleteAllBtn.onclick = () => {
			const checkboxs = getAllChecked();
			const ids = checkboxs.map(checkbox => checkbox.value);
			sumbitFormHandler(ids, '#softDeleteForm');
		}
	}

});