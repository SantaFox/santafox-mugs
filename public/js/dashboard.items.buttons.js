/* Надо подумать!!!
** Так как для разных функций - разная первая кнопка с отличным функционалом,
** то, возможно, проще и правильнее создавать форму напрямую в функции, а потом
** ее уничтожать.
** Только я пока не знаю как корректно ее уничтожить. .destroy()?
*/

function fnButtonAdd() {
	// Исправление бага с выделением нажатой кнопки
	$("#create-item").removeClass("ui-state-focus ui-state-hover");
        
	// Небольшие предварительные настройки формы
	$('#dialog-form input').val( '' );

	// Собственно говоря, кроме даты ничего в голову не приходит
	var tToday = new Date();
	$('#itemBoughtDate').val( $.format.date(tToday, "dd.MM.yy") );
	
	// Настройка формы и заголовка
	$("#dialog-form").dialog( "option", "title", "Добавление")
	$("#dialog-form").dialog( "option", "buttons", {
		"Добавить": function() {
            var aFormData = $(this).children("form").serializeArray();

			var selectedTab = $('input:radio[name="selectedClient"]:checked'),
				clientId = selectedTab.data('clientId');
			aFormData.push( {'name': 'itemClientId', 'value': clientId } );

            // Теперь надо нормализовать некоторые значения
            $.each(aFormData, function(index, aFormElement) { 
                if (aFormElement.name == 'itemBoughtDate') { aFormElement.value = $.format.date($.format.date(aFormElement.value, "dd.MM.yy"), "yyyy-MM-dd") };
                if (aFormElement.name == 'itemBalanceSum') { aFormElement.value = $.format.number($.format.number(aFormElement.value, "#0.000000000"), "#0.00") };
                if (aFormElement.name == 'itemTaxSum') { aFormElement.value = $.format.number($.format.number(aFormElement.value, "#0.000000000"), "#0.00") };
            } );
            
            $.ajax({
                dataType: "json",
                type: "POST",
				url: "/items/add",
				data: aFormData,
                success: function (response) {				// Ошибка в моделях на сервере считается корректным исполнением запроса
                	if (response.status == "fail") {
                		$.showMessage(response.message, 'ui-state-error');
                	};
                	if (response.status == "success") {
                		$.showMessage(response.message);
						$("#dialog-form").dialog("close");
						$('#itemsTable').dataTable().fnDraw();
                	};
				},
				error: function() {				// Possible values for the second argument (besides null) are "timeout", "error", "abort", and "parsererror". 
				}
			});
		},
		"Отмена": function() {
			$(this).dialog("close");
		}
	} );
	
	// Вызываем модальный диалог
	$("#dialog-form").dialog( "open" );
};
    
function fnButtonUpdate() {
	// Исправление бага с выделением нажатой кнопки
	$("#update-item").removeClass("ui-state-focus ui-state-hover");

	// Небольшие предварительные настройки формы
	var iSelectedRow = $('#itemsTable').data('selectedRow');

	// Нам надо как-то загрузить поля формы соответствующими полями из строки таблицы
	// Следующий кусок наверняка можно нарисовать как-то покрасивее????
	var editRow;
	var aData = $("#itemsTable").dataTable().fnGetData();
	for (ar in aData) {
		if (aData[ar][0] == iSelectedRow) { editRow = aData[ar]; }
	};
    // format.number используется для РАСКОДИРОВАНИЯ текстовых строк!!!
	$('#itemBoughtDate').val( editRow[1] );
	$('#assetName').val( editRow[2] );
	$('#itemAmount').val( $.format.number( editRow[3], "#,##0" ) );
	$('#itemBalanceSum').val( $.format.number( editRow[4], "#,##0.00") );
	$('#itemTaxSum').val( $.format.number( editRow[6], "#,##0.00") );
	$('#itemBuyReason').val( editRow[12] );

	// Настройка формы и заголовка
	$("#dialog-form").dialog( "option", "title", "Изменение");
	$("#dialog-form").dialog( "option", "buttons", {
		"Изменить": function() {
			// Код изменения записи(ей) где-то здесь
            var aFormData = $(this).children("form").serializeArray();
            aFormData.push( {'name': 'id', 'value': iSelectedRow} );
            // Теперь надо нормализовать некоторые значения
            $.each(aFormData, function(index, aFormElement) { 
                if (aFormElement.name == 'itemBoughtDate') { aFormElement.value = $.format.date($.format.date(aFormElement.value, "dd.MM.yy"), "yyyy-MM-dd") };
                if (aFormElement.name == 'itemBalanceSum') { aFormElement.value = $.format.number($.format.number(aFormElement.value, "#0.000000000"), "#0.00") };
                if (aFormElement.name == 'itemTaxSum') { aFormElement.value = $.format.number($.format.number(aFormElement.value, "#0.000000000"), "#0.00") };
            } );
            
            $.ajax({
                dataType: "json",
                type: "POST",
				url: "/items/update",
				data: aFormData,
                success: function (response) {				// Ошибка в моделях на сервере считается корректным исполнением запроса
                	if (response.status == "fail") {
                		$.showMessage(response.message, 'ui-state-error');
                	};
                	if (response.status == "success") {
                		$.showMessage(response.message);
						$("#dialog-form").dialog("close");
						$('#itemsTable').dataTable().fnDraw();
                	};
				},
				error: function() {				// Possible values for the second argument (besides null) are "timeout", "error", "abort", and "parsererror". 
				}
			});
		},
		"Отмена": function() {
			$(this).dialog("close");
		}
	} );
	
	// Вызываем модальный диалог
	$("#dialog-form").dialog( "open" );        
};

function fnButtonDelete() {
	// Исправление бага с выделением нажатой кнопки
	$("#delete-item").removeClass("ui-state-focus ui-state-hover");
        
	// Небольшие предварительные настройки формы
	var iSelectedRow = $('#itemsTable').data('selectedRow');
	// Такая длинная адресация нужна из-за структуры <p><span>иконка</span>text</p>
	$("#dialog-delete p")[0].childNodes[1].nodeValue = "Будет удалена партия с id = " + iSelectedRow + ". Вы уверены?";

	// Настройка формы
	$("#dialog-delete").dialog( "option", "buttons", {    
		"Удалить": function() {
			$(this).dialog("close");
			var aData = { 'id': iSelectedRow };
            $.ajax({
                dataType: "json",
                type: "POST",
				url: "/items/delete",
				data: aData,
                success: function (response) {				// Ошибка в моделях на сервере считается корректным исполнением запроса
                	if (response.status == "fail") {
                		$.showMessage(response.message, 'ui-state-error');
                	};
                	if (response.status == "success") {
                		$.showMessage(response.message);
						$('#itemsTable').dataTable().fnDraw();
                	};
				},
				error: function() {				// Possible values for the second argument (besides null) are "timeout", "error", "abort", and "parsererror". 
				}
			} );
		},
		"Отмена": function() {
			$(this).dialog("close");
		}
	} );

	// Вызываем модальный диалог
	$("#dialog-delete").dialog("open");
};

function fnButtonSell() {
	// Исправление бага с выделением нажатой кнопки
	$("#sell-item").removeClass("ui-state-focus ui-state-hover");

	// Небольшие предварительные настройки формы
	var iSelectedRow = $('#itemsTable').data('selectedRow');

	// Дата - предположительно сегодня, количество - максимум бумаги
	// Цену мы не знаем вообще, строку комментария тоже
	$('#dialog-sell input').val( '' );

	var tToday = new Date();
	$('#itemSellDate').val( $.format.date(tToday, "dd.MM.yy") );
	
	// Здесь надо посчитать общее количество бумаг для продажи
	// Нам надо как-то загрузить поля формы соответствующими полями из строки таблицы
	// Следующий кусок наверняка можно нарисовать как-то покрасивее????
	var curRow;
	var aData = $("#itemsTable").dataTable().fnGetData();
	for (ar in aData) {
		if (aData[ar][0] == iSelectedRow) { curRow = aData[ar]; }
	};
	var sAssetName = curRow[2];
	var iTotalQuantity = 0;
	for (ar in aData) {
		if (aData[ar][2] == sAssetName) { iTotalQuantity += $.format.number( aData[ar][3], "#,##0" ) }		// В aData хранится уже отформатированные значения
	};
 	$('#itemSellAmount').val( iTotalQuantity );
	
 	// Настройка формы
	$("#dialog-sell").dialog( "option", "buttons", {
		"Подтвердить": function() {
			// Код изменения записи(ей) где-то здесь
            var aFormData = $(this).children("form").serializeArray();

            // Теперь надо нормализовать некоторые значения
            $.each(aFormData, function(index, aFormElement) { 
                if (aFormElement.name == 'itemSellDate') { aFormElement.value = $.format.date($.format.date(aFormElement.value, "dd.MM.yy"), "yyyy-MM-dd") };
                if (aFormElement.name == 'itemSellSum') { aFormElement.value = $.format.number($.format.number(aFormElement.value, "#0.000000000"), "#0.00") };
            } );
            
            $.ajax({
                dataType: "json",
                type: "POST",
				url: "/items/sell",
				data: aFormData,
                success: function (response) {				// Ошибка в моделях на сервере считается корректным исполнением запроса
                	if (response.status == "fail") {
                		$.showMessage(response.message, 'ui-state-error');
                	};
                	if (response.status == "success") {
                		$.showMessage(response.message);
						$("#dialog-sell").dialog("close");
						$('#itemsTable').dataTable().fnDraw();
                	};
				},
				error: function() {				// Possible values for the second argument (besides null) are "timeout", "error", "abort", and "parsererror". 
				}
			});
		},
		"Отмена": function() {
			$(this).dialog("close");
		}
	} );
	
	// Вызываем модальный диалог
	$("#dialog-sell").dialog( "open" );        
	
	$.showMessage( Date().toString() );
}

function fnProcessButtons() {
	// ToDo: кнопка "Добавить" разблокируется только после выбора какого-нибудь таба
	var aSelectedTab = $('input:radio[name="selectedClient"]:checked')
	var iSelectedRow = $('#itemsTable').data('selectedRow') || 0;
	
	$("#add-item").button( "option", "disabled", !( aSelectedTab.length == 1 ) || $("#add-item").hasClass("privilege-disabled") );
	$("#update-item").button("option", "disabled", !( iSelectedRow != 0 ) || $("#update-item").hasClass("privilege-disabled") );
	$("#sell-item").button("option", "disabled", !( iSelectedRow != 0 ) || $("#sell-item").hasClass("privilege-disabled") );
	$("#delete-item").button("option", "disabled", !( iSelectedRow != 0 ) || $("#delete-item").hasClass("privilege-disabled") );			
};

/*
$(function() {

	// load the modal window
	$('a.modal').click(function(){

		// scroll to top
		$('html, body').animate({scrollTop:0}, 'fast');

		// before showing the modal window, reset the form incase of previous use.
		$('.success, .error').hide();
		$('form#contactForm').show();

		// Reset all the default values in the form fields
		$('#name').val('Your name');
		$('#email').val('Your email address');
		$('#comment').val('Enter your comment or query...');

		//show the mask and contact divs
		$('#mask').show().fadeTo('', 0.7);
		$('div#contact').fadeIn();

		// stop the modal link from doing its default action
		return false;
	});

	// close the modal window is close div or mask div are clicked.
	$('div#close, div#mask').click(function() {
		$('div#contact, div#mask').stop().fadeOut('slow');

	});

	$('#contactForm input').focus(function() {
		$(this).val(' ');
	});

	// when the Submit button is clicked...
	$('input#submit').click(function() {
		//Inputed Strings
		var username = $('#name').val(),
			email = $('#email').val(),
			comment = $('#comment').val();

		//Error Count
		var error_count;

		//Regex Strings
		var username_regex = /^[a-z0-9_-]{3,16}$/,
			email_regex = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

			//Test Username
			if(!username_regex.test(name)) {
				$('#contact_header').after('<p class=error>Invalid username entered!</p>');
				error_count += 1;
			}

			//Test Email
			if(!email_regex.test(email)) {
				$('#contact_header').after('<p class=error>Invalid email entered!</p>');
				error_count += 1;
			}

			//Blank Comment?
			if(comment == '') {
				$('#contact_header').after('<p class=error>No Comment was entered!</p>');
				error_count += 1;
			}

			//No Errors?
			if(error_count === 0) {
				$.ajax({
					type: "post",
					url: "send.php",
					data: "name=" + name + "&email=" + email + "&comment=" + comment,
					error: function() {
						$('.error').hide();
						$('#sendError').slideDown('slow');
					},
					success: function () {
						$('.error').hide();
						$('.success').slideDown('slow');
						$('form#contactForm').fadeOut('slow');
					}
				});
			}

			else {
                $('.error').show();
            }

		return false;
	});

});

*/