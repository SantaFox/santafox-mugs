function fnDatatableInit() {
	$('#itemsTable').dataTable( {
		"bAutoWidth": false,
		"bPaginate": false,
		"bSort": false,
		"bJQueryUI": true,
		// "bInfo": false,
		"bProcessing": true,
		"bServerSide": true,
		"sAjaxSource": "/items/data",
		"fnServerData": function ( sSource, aoData, fnCallback ) {
			var selectedTab = $('input:radio[name="selectedClient"]:checked'),
				clientId = selectedTab.data('clientId');
			clientId = clientId || 0;
			aoData.push( { "name": "clientId", "value": clientId } );
			$.ajax( {
				dataType: 'json',
				type: "POST",
				url: sSource,
				data: aoData,
				success: function (data, textStatus, jqXHR) {
					// Задача 1 - проверить, вернулась ли выделенная строка, и обработать эту ситуацию
					
					// 1.1. Загружаем имеющееся значение
					var iSelectedRow = $('#itemsTable').data('selectedRow') || 0;
					// 1.2. Собираем в вектор значения поля id из полученных данных
					var curLineIds = [];
					$.each(data.aaData, function() { curLineIds.push(this[0]); } );
					// 1.3. Проверяем на вхождение
					if ($.inArray(iSelectedRow, curLineIds) == -1) {
						$('#itemsTable').data('selectedRow', 0)
					}
					// 1.4. На всякий случай обрабатываем командные кнопки
					fnProcessButtons();
					
					// Идем дальше по коду DataTables.Net
					fnCallback(data);
					
					// И запускаем заново таймер, если все-таки выбран какой-то таб
					if ( clientId != 0 ) {
						fnRestartCountdown();
					}
				}
			} );
		},
		"oLanguage": {
			"sProcessing":   "Загрузка данных с сервера...",
			"sZeroRecords":  "По клиенту нет открытых записей, либо клиент не выбран",
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
			var iSelectedRow = $('#itemsTable').data('selectedRow') || 0;
			if ( aData[0] == iSelectedRow ) {
				$(nRow).addClass('row_selected');
			}
			// Теперь выделяем красным отрицательные значения 
			// Делаем явное преобразование для пущей надежности
			// Не совсем понял td:eq(n), но эта n должна быть меньше на единицу так как первый столбец невидим
			if ( $.format.number(aData[10].substring(0, aData[10].length-1), "#0.00") < 0 ) { $('td:eq(9)',nRow).addClass('sf-red'); }
			if ( $.format.number(aData[11].substring(0, aData[11].length-1), "#0.00") < 0 ) { $('td:eq(10)',nRow).addClass('sf-red'); }
			
			return nRow;
		},
		"aoColumnDefs": [
			{ "sClass": "sf-right-aligned", "aTargets": [ 3, 4, 5, 6, 7, 8, 9, 10, 11 ] },
			{ "sClass": "sf-centered",      "aTargets": [ 1 ] },
			{ "fnRender": function ( oObj ) { return $.format.number($.format.number(oObj.aData[oObj.iDataColumn], "#0.000000000"), "#,##0.00") }, "aTargets": [ 4, 6, 9 ] },
			{ "fnRender": function ( oObj ) { return $.format.number($.format.number(oObj.aData[oObj.iDataColumn], "#0.000000000"), "#0.00") + "%" }, "aTargets": [ 10, 11 ] },
			{ "fnRender": function ( oObj ) { return $.format.number($.format.number(oObj.aData[oObj.iDataColumn], "#0.000000000"), "#0.0####") }, "aTargets": [ 5, 7, 8 ] },
			{ "fnRender": function ( oObj ) { return $.format.number($.format.number(oObj.aData[oObj.iDataColumn], "#0"), "#,##0") }, "aTargets": [ 3 ] },
			{ "fnRender": function ( oObj ) { return $.format.date($.format.date(oObj.aData[oObj.iDataColumn], "yyyy-MM-dd"), "dd.MM.yy") }, "aTargets": [ 1 ] }
		],
		"aoColumns": [
			{ "sName": "id",                    // 0: #
			  "bVisible": false },
			{ "sName": "itemBoughtDate",	    // 1: Дата
			  "sWidth": "6em" },
			{ "sName": "assetName",		        // 2: Бумага
			  "sWidth": "15em" },
			{ "sName": "itemAmount",		    // 3: Количество
			  "sWidth": "8em" },
			{ "sName": "itemBalanceSum",	    // 4: Балансовая стоимость
			  "sWidth": "9em" },
			{ "sName": "itemBalancePrice",	    // 5: Балансовая цена
			  "sWidth": "7em" },
			{ "sName": "itemTaxSum",		    // 6: Налоговая стоимость
			  "sWidth": "9em" },
			{ "sName": "itemTaxPrice",		    // 7: Налоговая цена
			  "sWidth": "7em" },
			{ "sName": "itemMarketQuote",	    // 8: Котировка
			  "sWidth": "5em" },
			{ "sName": "itemMarketSum",		    // 9: Рыночная стоимость
			  "sWidth": "9em" },
			{ "sName": "itemBalancePercent",    // 10: %% баланс
			  "sWidth": "7.5em" },
			{ "sName": "itemTaxPercent",		// 11: %% налог
			  "sWidth": "7.5em" },
			{ "sName": "itemBuyReason" }		// 12: Цель покупки
		],
		"sDom": '<"H"lfr>t<"F"ip<"#itemsTable_countdown">>'			// Дефолтовые строки - lfrtip или <"H"lfr>t<"F"ip>
	});

// Параметр sDom создает элемент #itemsTable_countdown, но для него надо еще указать дефолтный класс, чтобы
// этот класс можно было бы указывать в общем CSS
	$("#itemsTable_countdown").addClass("dataTables_countdown");
}
