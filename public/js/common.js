// User panel initialization
// http://web-kreation.com/index.php/tutorials/nice-clean-sliding-login-panel-built-with-jquery/
jQuery(document).ready( function() {
	$("#panelOpenLink").click(function(){
		$("div#panel").slideDown("slow");
	});	
	
	$("#panelCloseLink").click(function(){
		$("div#panel").slideUp("slow");	
	});		

	$("#toggle a").click(function () {
		$("#toggle a").toggle();
	});
	
	$("#userSettings input").button();
});
	

// Скопипизжено отсюда: http://projects.joreteg.com/jquery-sliding-message/
// Потом переработано под имеющуюся задачу
jQuery.showMessage = function(message, extraClass){

	settings = {
		 id: 'sliding_message_box',
		 size: '70',
		 delay: 1500,
		 speed: 500,
		 fontSize: '24px'
	};        
	
	// Раньше здесь был код проверки на наличие. Но из-за закругленных рамок
	// на мой взгляд проще пересоздавать DIV заново каждый раз
	var elem = $('<div></div>')
		.attr('id', settings.id)
		.addClass('ui-widget-content ui-corner-top')
		.css({'z-index': '999',
			  'text-align': 'center',
			  'position': 'absolute',
			  'position': 'fixed',
			  'bottom': '-' + settings.size + 'px',
			  'left': '50%',
			  'width': '70%',
			  'margin-left': '-35%',
			  'line-height': settings.size + 'px',
			  'font-size': settings.fontSize
		} )
		.html(message);

	if (typeof extraClass == 'string') {
		elem.addClass (extraClass)
	}

	$('body').append(elem);
	elem.animate({bottom: '0'}, settings.speed);
	setTimeout(function() {
			// Анимирование асинхронно, поэтому для сложного анимирования существует очередь
			// Но так как удаление объекта в очередь не входит, вызываем его в обработчике окончания анимации
			elem.animate( {
					'bottom': '-' + settings.size + 'px'
				},
				settings.speed,
				function() {
					elem.remove();
				} );
		},
		settings.delay
	);
}
