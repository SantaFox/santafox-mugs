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
		
		// Так как здесь не требуется такая система безопасности, как в других проектах, то распиcываем ее заново
		
	    if ( !$acl->isAllowed($role, $resource, $privilege) ) {
			if ( $isAjax ) {										// Если вызов AJAX, то в обоих случаях действуем вот так
				$log->debug("AccessControl: {$module}/{$controller}/{$privilege} not allowed for AJAX call from " . ( ( 'guest' == $role ) ? "unauthorized user" : "user {$user} ({$role})") );
				$result = array(
					'status' => 'fail',
					'message' => "Access forbidden for " . ( ( 'guest' == $role ) ? "unauthorized user" : "user {$user} with role {$role}" )
					);
				$jsonHelper = Zend_Controller_Action_HelperBroker::getStaticHelper('Json');
				$jsonHelper->sendJson( $result );
				// $request->setDispatched(false);					// Не знаю, нужно это или нет
			} else {
				$log->debug("AccessControl: {$module}/{$controller}/{$privilege} not allowed for user {$user} ({$role}), redirected to default/index/index");

				// not enough privilege
				$error = new ArrayObject(array(), ArrayObject::ARRAY_AS_PROPS);
				$error->type = 'UNAUTHORIZED_ACCESS';
				$error->request = clone $request;
				$error->exception = new Zend_Acl_Exception('Access Denied', 403);
				$request->setControllerName('error')
						->setActionName('error')
						->setParams(array(
								'error_handler' => $error,
								'returnUrl' => urlencode($request->getRequestUri())
						))
						->setDispatched(false);
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

