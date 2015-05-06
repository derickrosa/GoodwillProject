// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_self

$(document).on('page:change', function() {
	$('#new_group')
		.on('ajax:success', addGroup)
		.on('ajax:error', error);

	$('.delete-group')
		.on('ajax:success', deleteGroup)
		.on('ajax:error', error);

	$('#new_application')
		.on('ajax:success', addApplication)
		.on('ajax:error', error);

	$('.delete-application')
		.on('ajax:success', deleteApplication)
		.on('ajax:error', error);
	$('#new_friendship')
	.on('ajax:success', addGroup)
	.on('ajax:error', error);
	$('#new_record')
		.on('ajax:success', addGroup)
		.on('ajax:error', error);
});

function addApplication (e, data, status, xhr) {
	location.reload();
}

function addGroup (e, data, status, xhr) {
	location.reload();
	/*$('#group_name').val('');
	var link = $('<a></a>')
		.attr({
			'data-confirm': 'Are you sure?',
			'data-method': 'delete',
			'data-remote': 'true',
			'href': '/groups/'+data.id,
			'rel': 'nofollow',
			'class': 'delete-group pull-right'
		})
		.html('Destroy');

	var group = $('<p></p>')
		.addClass('page-header')
		.html(data.name)
		.append(link);

	$('.peoplelist').append(group);

	$('.delete-group')
		.on('ajax:success', deleteGroup)
		.on('ajax:error', error);*/
}

function deleteGroup (e, data, status, xhr) {
	$(this).parent().remove();
}

function deleteApplication (e, data, status, xhr) {
	location.reload();
}

function error (e, xhr, status, error) {
	alert('ERROR ' + xhr.status + ': ' + xhr.statusText, { type: 'danger' });
}