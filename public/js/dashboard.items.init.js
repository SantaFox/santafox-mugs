// Определение текущей локали для jQuery.format
$.format.locale({
	date: {
		format: 'dddd, dd MMMM yyyy, hh:mm:ss',
		monthsFull: ['января','февраля','марта','апреля','мая','июня','июля','августа','сентября','октября','ноября','декабря'],
		monthsShort: ['Янв','Фев','Мар','Апрr','Май','Июн','Июл','Авг','Сен','Окт','Ноя','Дек'],
		daysFull: ['Воскресение','Понедельник','Вторник','Среда','Четверг','Пятница','Суббота'],
		daysShort: ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'],
		timeFormat: 'hh:mm',
		shortDateFormat: 'dd.MM.yy',
		longDateFormat: 'dddd, dd MMMM, yyyy'
	},
	number: {
		format: '#,##0.0#',
		groupingSeparator: ' ',
		decimalSeparator: '.'
	}    
} );

function fnElementsInit() {
	// Инициализация стандартных элементов jQuery
	// Должна происходить только здесь!!!
	
	// Возникла идея реализовать табы клиента через AJAX
	// Чтобы не делать жесткий идиотизм в виде синхронного запроса, надо четко продумать ситуевину
	// что там видно на экране на время запроса, что происходит после и что происходит по таймауту
	$.ajax( {
		dataType: 'json',
		type: "POST",
		url: '/clients/list',
		success: function(data, textStatus, jqXHR) {
			$.each(data, function(index, value) {
				var elInput = $('<input type="radio" />'),
					elLabel = $('<label />');
				elInput.attr('id', 'tabClient' + value.id)
					   .attr('name', 'selectedClient')
					   .data('clientId', value.id);
				elLabel.attr('for', elInput.attr('id'))
					   .attr('title', value.clientName)
					   .text(value.clientCode);
					   
				$('#tabClients').append(elInput)
								.append(elLabel);
			} );
			// Табы клиента - на самом деле не табы, а радиобуттоны
			$('#tabClients').buttonset();
			$('#tabClients input').click( function(oEvent) {
				$('#itemsTable').dataTable().fnDraw();
			} );
		}
	} );
	
	// Кнопки операций с выбранными строками
	$("#add-item").button( { disabled: true } );
	$("#update-item").button( { disabled: true } );
	$("#sell-item").button( { disabled: true } );
	$("#delete-item").button( { disabled: true } );
	
	// Элементы формы
	$( "#itemBoughtDate" ).datepicker({
		showOn: "button",
		buttonImage: "/images/ui-calendar_15x16.gif",
		buttonImageOnly: true,
		dateFormat: "dd.mm.y"
	} );
	$("#assetName").autocomplete( {
		source: "/assets/completion",
		minLength: 2,
		select: function( event, ui ) {
			alert( ui.item ? "Selected: " + ui.item.value + " aka " + ui.item.id : "Nothing selected, input was " + this.value);
		}
	} );
	$( "#itemSellDate" ).datepicker({
		showOn: "button",
		buttonImage: "/images/ui-calendar_15x16.gif",
		buttonImageOnly: true,
		dateFormat: "dd.mm.y"
	} );

	// Сами формы
	$("#dialog-form").dialog( {
		autoOpen: false,
		height: 450,
		width: 500,
		resizable: false,
		modal: true
	} );        
        
	$("#dialog-delete").dialog( {
		autoOpen: false,
		resizable: false,
		modal: true,
	} );
	
	$("#dialog-sell").dialog( {
		autoOpen: false,
		height: 450,
		width: 500,
		resizable: false,
		modal: true
	} );   
	
	// Обработка нажатия на строку таблицы
	$('#itemsTable tbody tr').live('click', function() {
		var oTable = $('#itemsTable').dataTable();
		var aData = oTable.fnGetData( this );	// Сначала получаем массив данных выбранной строки (передавая указатель this)
		var iRowId = aData[0];

		var iSelectedRow = $('#itemsTable').data('selectedRow') || 0;
		
		if ( iSelectedRow != iRowId ) {
			$(oTable.fnSettings().aoData).each( function () {
				if ( this._aData[0] == iSelectedRow ) {
					$(this.nTr).removeClass('row_selected');
				}
			} );
			$(this).toggleClass('row_selected');
			$('#itemsTable').data('selectedRow', iRowId)
		} else {
			$(this).toggleClass('row_selected');
			$('#itemsTable').data('selectedRow', 0)
		}
		
		// Теперь перещелкиваем кнопки в зависимости от выбранных строк
		fnProcessButtons();
	} );
}

function fnRestartCountdown() {
	var d = $("#itemsTable_countdown");		// Это не объект, это коллекция из одного элемента
	var refreshSec = 10;
	
	d.stopTime();							// Вызывается на случай, если обновилось еще пока идет таймер

	d.html("Обновление&nbsp;через&nbsp<span>" + refreshSec + "</span>&nbsp;сек.");

	d.everyTime("1s",
		"countdown",
		function (i) {
			$(this).children("span").text(refreshSec - i);
		},
		refreshSec)
	 .oneTime(refreshSec + "s",
		"refresh",
		function () {
			$('#itemsTable').dataTable().fnDraw();
		});
		
}