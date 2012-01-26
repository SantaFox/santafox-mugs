<?php
/**
 * StarbucksMugs
 *
 * @package		site
 * @subpackage	plugins
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 * @version		$Id: AccessControl.php 168 2011-03-07 21:02:02Z santafox $
 */

/**
 * Плагин контроллера для проверки идентификации и прав пользователя
 *
 * @package		site
 * @subpackage	plugins
 */
class Application_Plugin_AccessControl extends Zend_Controller_Plugin_Abstract {

    /**
     * Обработка события перед запуском метода контроллера
     *
	 * @todo	Посмотреть в комментариях продвинутый код обработки ошибок авторизации
     */
	public function preDispatch(Zend_Controller_Request_Abstract $request) {
		$log = Zend_Registry::get('log');

		$auth = Zend_Auth::getInstance();
		$acl = Application_Model_Acl::getACL();						// Здесь получаем ACL из модели

		$isAjax = $request->isXmlHttpRequest();						// Для ошибок доступа AJAX отдельная логика
		
		if ( $auth->hasIdentity() ) {
			$role = $auth->getIdentity()->userRole;
			$user = $auth->getIdentity()->userName;
		} else {
			$user = 'guest';
			$role = 'guest';										// Я так понимаю, это наименование роли пользователя
		}

		if ( !$acl->hasRole($role) ) {								// Проверяем наличие указанной роли в ACL
			$log->crit("AccessControl: не обнаружена роль {$role}, сбрасываю до незалогиненного гостя");
			$role = 'guest';										// И если такого нет - то считаем что пользователь GUEST
		}

		$module = $request->getModuleName();
		$controller = $request->getControllerName();

		if ($module == 'default' || $module == '')					// Формируем наименование ресурса
			$resource = $controller;								// Это строка - Контроллер
		else
			$resource = $module . ':' . $controller;				// Или, в редком случае, Модуль:Контроллер

		$privilege = $request->getActionName();						// Имя действия - это как раз привилегия для ACL

		// Итак, момент истины. Варианты отработки запрета доступа следующие:
		// AJAX + есть логин	- возврат ошибки через стандартный протокол JSON (status/message)
		// AJAX + нет логина	- возврат ошибки через стандартный протокол JSON (status/message)
		// HTTP + есть логин	- переадресация на /index/index
		// HTTP + нет логина	- переадресация на /login/index
		
		// Так как здесь не требуется такая система безопасности, как в других проектах, то распиcываем ее заново
		
	    if ( !$acl->isAllowed($role, $resource, $privilege) ) {
			if ( $isAjax ) {										// Если вызов AJAX, то в обоих случаях действуем вот так
				$log->debug("AccessControl: {$module}/{$controller}/{$privilege} not allowed for AJAX call from " . ( ( 'guest' == $role ) ? "unauthorized user" : "user {$user} ({$role})") );
				$result = array(
					'status' => 'fail',
					'message' => "Доступ к запрошенному ресурсу запрещен " . ( ( 'guest' == $role ) ? "неавторизованному пользователю" : "пользователю {$user} с ролью {$role}" )
					);
				$jsonHelper = Zend_Controller_Action_HelperBroker::getStaticHelper('Json');
				$jsonHelper->sendJson( $result );
				// $request->setDispatched(false);					// Не знаю, нужно это или нет
			} elseif ( !$role == 'guest' ) {						// Есть логин и роль, то есть пользователям нельзя
				$log->debug("AccessControl: {$module}/{$controller}/{$privilege} not allowed for user {$user} ({$role}), redirected to default/index/index");

				// not enough privilege
				$error = new ArrayObject(array(), ArrayObject::ARRAY_AS_PROPS);
				$error->type = self::UNAUTHORIZED_ACCESS;
				$error->request = clone $req;
				$error->exception = new Zend_Acl_Exception('Access Denied', 403);
				$req->setControllerName('error')
						->setActionName('error')
						->setParams(array(
								'error_handler' => $error,
								'returnUrl' => urlencode($req->getRequestUri())
						))
						->setDispatched(false);
			} else {												// Нет логина, значит направляем на страницу регистрации
				$log->debug("AccessControl: {$module}/{$controller}/{$privilege} not allowed for guest (not logged in), redirected to default/login/index");
				$request->setModuleName('default')
						->setControllerName('login')
						->setActionName('index');
			}
		} else {
			$log->debug("AccessControl: {$module}/{$controller}/{$privilege} allowed for user $user ({$role})");
			$viewRendererHelper = Zend_Controller_Action_HelperBroker::getStaticHelper('viewRenderer');
			if (null === $viewRendererHelper->view) {
				$viewRendererHelper->initView();					// Если мы проснулись раньше всех, то инициализируем view
			}
			$view = $viewRendererHelper->view;
			$view->auth = $auth;									// Передаем объект авторизации во view и layout
		}
	}
}
/*
	http://stackoverflow.com/questions/3421761/zend-framework-predispatch-acl-plugin-causes-requests-to-non-existent-page-to-ac

	if (!$acl->isAllowed($role, $resource, $privilege)) {
		$redirector = Zend_Controller_Action_HelperBroker::getStaticHelper('Redirector');
		if (!$auth->hasIdentity()) {
			// login required
			$flashMessenger = Zend_Controller_Action_HelperBroker::getStaticHelper('FlashMessenger');
			$flashMessenger->addMessage('You need to login first');
			$redirector->gotoSimple('login', 'auth', 'default', array(
													'returnUrl' => urlencode($req->getRequestUri())
													));

		} else {
			// not enough privilege
			$error = new ArrayObject(array(), ArrayObject::ARRAY_AS_PROPS);
			$error->type = self::UNAUTHORIZED_ACCESS;
			$error->request = clone $req;
			$error->exception = new Zend_Acl_Exception('Access Denied', 403);
			$req->setControllerName('error')
					->setActionName('error')
					->setParams(array(
							'error_handler' => $error,
							'returnUrl' => urlencode($req->getRequestUri())
					))
					->setDispatched(false);
		}
	}

*/
