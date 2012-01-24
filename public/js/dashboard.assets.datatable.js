function fnDatatableInit() {
	return $('#assetsTable').dataTable( {
		"bAutoWidth": false,
		"bPaginate": false,
		"bSort": false,
		"bJQueryUI": true,
		"bProcessing": true,
		"bServerSide": true,
		"sAjaxSource": "/assets/data",
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
			"sZeroRecords":  "Активы не найдены",
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
			
			// Теперь применяем цвет industryRGB к полю industryName
			$('td:eq(2)', nRow).css('color', aData[6]);
			
			return nRow;
		}, /*
		"aoColumnDefs": [
			{ "sClass": "sf-right-aligned", "aTargets": [ 3, 4, 5, 6, 7, 8, 9, 10, 11 ] },
			{ "sClass": "sf-centered",      "aTargets": [ 1 ] },
			{ "fnRender": function ( oObj ) { return $.format.number($.format.number(oObj.aData[oObj.iDataColumn], "#0.000000000"), "#,##0.00") }, "aTargets": [ 4, 6, 9 ] },
			{ "fnRender": function ( oObj ) { return $.format.number($.format.number(oObj.aData[oObj.iDataColumn], "#0.000000000"), "#0.00") + "%" }, "aTargets": [ 10, 11 ] },
			{ "fnRender": function ( oObj ) { return $.format.number($.format.number(oObj.aData[oObj.iDataColumn], "#0.000000000"), "#0.0####") }, "aTargets": [ 5, 7, 8 ] },
			{ "fnRender": function ( oObj ) { return $.format.number($.format.number(oObj.aData[oObj.iDataColumn], "#0"), "#,##0") }, "aTargets": [ 3 ] },
			{ "fnRender": function ( oObj ) { return $.format.date($.format.date(oObj.aData[oObj.iDataColumn], "yyyy-MM-dd"), "dd.MM.yy") }, "aTargets": [ 1 ] }
		],*/
		"aoColumns": [
			{ "sName": "id",                    // 0: #
			  "bVisible": false },
			{ "sName": "assetName"},	        // 1: Наименование
			{ "sName": "className",				// 2: Класс
			  "sWidth": "15em" },
			{ "sName": "industryName",			// 3: Отрасль
			  "sWidth": "25em" },
			{ "sName": "assetNameMICEX",	    // 4: Имя ММВБ
			  "sWidth": "9em" },
			{ "sName": "assetCodeMICEX",	    // 5: Код ММВБ
			  "sWidth": "9em" },
			{ "sName": "industryRGB",		    // 6: Цвет
			  "bVisible": false }
		]
	} );
}
