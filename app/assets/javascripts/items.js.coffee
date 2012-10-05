
$( "#sortable" ).sortable({
	update: (event, ui) ->
			items = $("#sortable").sortable("toArray",{attribute: "idItem"})
			update_position(items)
	});
$( "#sortable" ).disableSelection();

update_position = (items_ids) ->
	data = 
		items: items_ids

	$.get('admins/items/update_position',data, (response) ->
			
		).error( () ->
				alert "Falha ao tentar ordenar os items!! :(" 
			);