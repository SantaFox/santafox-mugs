<?php
/**
 * StarbucksMugs
 *
 * @package		site
 * @subpackage	controllers
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 * @version		$Id: IndexController.php 168 2011-03-07 21:02:02Z santafox $
 */

/**
 * Контроллер для администраторских действий
 *
 * @package		site
 * @subpackage	controllers
 */
class AdminController extends Zend_Controller_Action {

    /**
     * Действие контроллера - стандартный обработчик /index
     *
     */
    public function indexAction() {
		// Читаем ACL из модели и отдаем его шаблону, чтобы он заблокировал недоступные кнопки.
		// Но как-то это кривовато, надо придумать что-нибудь поэлегантнее.
		$this->view->acl = Application_Model_Acl::getACL();
    }

}
