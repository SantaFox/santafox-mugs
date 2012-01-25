<?php
/**
 * StarbuckMugs
 *
 * @package		site
 * @subpackage	controllers
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 * @version		$Id: IndexController.php 168 2011-03-07 21:02:02Z santafox $
 */

/**
 * Контроллер для обработки дефолтовых путей приложения
 *
 * @package		site
 * @subpackage	controllers
 */
class IndexController extends Zend_Controller_Action {

    /**
     * Действие контроллера - стандартный обработчик /index
     *
     * Производит редирект на основную рабочую страничку {@link CountriesController::indexAction()}.
     * А вообще, теоретически, может рисовать титульную страничку
     */
    public function indexAction() {
       	$this->_redirect("/countries");
    }

}
