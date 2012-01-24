function fnDatatableInit() {
	return $('#quotesTable').dataTable( {
		"bAutoWidth": false,
		"bPaginate": false,
		"bSort": false,
		"bJQueryUI": true,
		"bProcessing": true,
		"bServerSide": true,
		"sAjaxSource": "/quotes/data",
		"fnServerData": function ( sSource, aoData, fnCallback ) {
			$.ajax( {
				dataType: 'json',
				type: "POST",
				url: sSource,
				data: aoData,
				success: fnCallback
			} );
		},
		"oLanguage": {
			"sProcessing":   "Загрузка данных с сервера...",
			"sZeroRecords":  "Котировки не найдены",
			"sInfo":         "Найдено _TOTAL_ записей",
			"sInfoEmpty":    "Записей не найдено",
			"sInfoFiltered": "(отфильтровано до _MAX_ записей)",
			"sSearch":       "Поиск:",
			"sUrl":          "",										// ToDo: Надо бы запихнуть это на сервер
			"oPaginate": {
				"sFirst": "Первая",
				"sPrevious": "Предыдущая",
				"sNext": "Следующая",
				"sLast": "Последняя"
			}
		}, 
		"fnRowCallback": function( nRow, aData, iDisplayIndex ) {
			// Первый кусочек - раскрашиваем "выбранную строчку"
			// Выделить можно несколько строк, кнопки отрабатываются соответственно
			if ( jQuery.inArray(aData[0], aiSelectedRows) != -1 ) {
				$(nRow).addClass('row_selected');
			}
			
			return nRow;
		},
		"aoColumnDefs": [
			{ "sClass": "sf-right-aligned", "aTargets": [ 2 ] },
			{ "sClass": "sf-centered",      "aTargets": [ 3 ] },
			{ "fnRender": function ( oObj ) { return $.format.number($.format.number(oObj.aData[oObj.iDataColumn], "#0.000000000"), "#0.0####") }, "aTargets": [ 2 ] },
			{ "fnRender": function ( oObj ) { return $.format.date($.format.date(oObj.aData[oObj.iDataColumn], "yyyy-MM-dd HH:mm:ss"), "dd.MM.yy HH:mm:ss") }, "aTargets": [ 3 ] }
		],
		"aoColumns": [
			{ "sName": "id",                // 0: #
			  "bVisible": false },
			{ "sName": "assetName",	        // 1: Наименование
			  "sWidth": "15em" },
			{ "sName": "quoteValue",		// 2: Котировка
			  "sWidth": "10em" },
			{ "sName": "quoteMoment",		// 3: Момент
			  "sWidth": "10em" },
			{ "sName": "quoteSource" }	    // 4: Источник
		]
	} );
}
