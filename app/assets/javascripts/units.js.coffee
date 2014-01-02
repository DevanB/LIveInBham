# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#availDate').fdatepicker
		format: 'yyyy-mm-dd'
	$('.featured_off').click (e) ->
		e.preventDefault
		id = $(this).attr('id')
		$.ajax
			type: 'POST'
			url: '/units/' + id + '.json'
			dataType: 'json'
			data: { _method: 'PUT', unit: { featured: true } }
			error: (errorThrown) ->
				alert errorThrown
				return false
			success: (data) -> 
				$('a#'+ id).children('i').remove()
				$('a#'+ id).attr('class', 'featured_on')
				$('a#'+ id).html('<i class="fa fa-star fa-lg"></i>')

	$('.featured_on').click (e) ->
		e.preventDefault
		id = $(this).attr('id')
		$.ajax
			type: 'POST'
			url: '/units/' + id + '.json'
			dataType: 'json'
			data: { _method: 'PUT', unit: { featured: false } }
			error: (errorThrown) ->
				alert errorThrown
				return false
			success: (data) ->
				$('a#'+ id).children('i').remove()
				$('a#'+ id).attr('class', 'featured_off')
				$('a#'+ id).html('<i class="fa fa-star-o fa-lg"></i>')
	$('.delete_unit').bind 'ajax:success', ->
  		$(this).closest('tr').fadeOut()