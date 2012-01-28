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
     * Действие контроллера - стандартный обработчик /acquire
     *
     */
    public function acquireAction() {
		// Читаем ACL из модели и отдаем его шаблону, чтобы он заблокировал недоступные кнопки.
		// Но как-то это кривовато, надо придумать что-нибудь поэлегантнее.
		$this->view->acl = Application_Model_Acl::getACL();
    }

	/**
	 * Действие контроллера - загрузка списка кружек с сайта Википедии
	 *
	 */
	public function proxyAction() {
		//$url='www.zend.com';
		//$client = new Zend_Http_Client($url);
		//$response = $client->request();
		//$html = $response->getBody();
	
		$listFile = '/Applications/MAMP/htdocs/Starbucks_City_Mugs.html';
		$html = file_get_contents($listFile);
		
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		echo $html;
	}

    /**
     * (AJAX) Действие контроллера - получение списка стран для сверки с вики
     *
	 * В запросе не требуется никакая информация. Вызывается модель, возвращающая <b>Zend_Db_Rowset</b>,
	 * который потом конвертируется в ассоциативный массив формата "Имя столбца" => "Значение".
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>countryName/li>
     * <li>countryAcquireAlias</li>
     * </ul>
	 * JSON возвращает такой массив в виде массива объектов с тремя указанными свойствами.
	 *
	 * @uses	Application_Model_DbTable_Countries::getCountriesForAcquire()
	 * @todo	ИСПРАВИТЬ ОПИСАНИЕ!!!!
     */
	public function countriesAction() {
        $log = Zend_Registry::get('log');
        
        $request = $this->getRequest();
        
		// Сначала предотвратим некорректный вызов процедуры
        $isAjax = $request->isXmlHttpRequest();
        if (!$isAjax) {
            $log->alert('Попытка вызова admin/countries напрямую, без AJAX');
            die();
        }
        
        // Получаем код клиента из запроса и вызываем модель
        $countriesTable = new Application_Model_DbTable_Countries();
        $result = $countriesTable->getCountriesForAcquire();
        
        $log->info("Был вызван admin/countries напрямую методом " . ($request->isPost() ? "POST" : "GET") . ", получено записей = " . count($result));

        $this->_helper->json($result->toArray());
	}
}
