<?php
/**
 * Контроллер для генерации главной страницы приложения
 *
 * @package		site
 * @subpackage	controllers
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 */
class IndexController extends Zend_Controller_Action {

    /**
     * Действие контроллера - стандартный обработчик /index
     *
     */
    public function indexAction() {
		// Читаем ACL из модели и отдаем его шаблону, чтобы он заблокировал недоступные кнопки.
		// Но как-то это кривовато, надо придумать что-нибудь поэлегантнее.
		$this->view->acl = Application_Model_Acl::getACL();
		
		$auth = Zend_Auth::getInstance();
        if ( $auth->hasIdentity() ) {
        	$userId = $auth->getIdentity()->id;
        	$this->view->userId = $userId;
        	
        	// Теперь сюда надо загрузить настройки пользователя, чтобы форма отработала начальное положение переключателей
        	$settingsModel = new Application_Model_Settings();
        	$this->view->userSettings = $settingsModel->getUserSettings($userId);
        }
    }

}
