<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	controllers
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Alpha
 * @version		$Id: IndexController.php 168 2011-03-07 21:02:02Z santafox $
 */

/**
 * Контроллер для обработки дефолтовых путей приложения
 *
 * @package		dashboard
 * @subpackage	controllers
 */
class IndexController extends Zend_Controller_Action {

    /**
     * Действие контроллера - стандартный обработчик /index
     *
     * Производит редирект на основную рабочую страничку {@link ItemsController::indexAction()}.
     */
    public function indexAction() {
       	$this->_redirect("/items");
    }

}
