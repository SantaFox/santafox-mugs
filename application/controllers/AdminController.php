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

	/**
	 * Действие контроллера - обработка списка кружек с сайта Википедии
	 *
	 */
	public function acquireAction() {
		//$url='www.zend.com';
		//$client = new Zend_Http_Client($url);
		//$response = $client->request();
		//$html = $response->getBody();
	
		$listFile = '/Applications/MAMP/htdocs/Starbucks_City_Mugs.html';
		$html = file_get_contents($listFile);
		
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		echo $html;
/*
		$dom = new Zend_Dom_Query($html);
	    $results = $dom->query('h2');
    	$count = count($results); // получение числа соответствий: 4
    	foreach ($results as $result) {
        	// переменная $result имеет тип DOMElement
        	Zend_Debug::dump($result);
        }
*/

	}

}
