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
	
    /**
     * (AJAX) Действие контроллера - получение списка серий для сверки с вики
     *
	 * В запросе не требуется никакая информация. Вызывается модель, возвращающая <b>Zend_Db_Rowset</b>,
	 * который потом конвертируется в ассоциативный массив формата "Имя столбца" => "Значение".
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>serieName/li>
     * <li>serieAcquireAlias</li>
     * </ul>
	 * JSON возвращает такой массив в виде массива объектов с тремя указанными свойствами.
	 *
	 * @uses	Application_Model_DbTable_Series::getSeriesForAcquire()
	 * @todo	ИСПРАВИТЬ ОПИСАНИЕ!!!!
     */
	public function seriesAction() {
        $log = Zend_Registry::get('log');
        
        $request = $this->getRequest();
        
		// Сначала предотвратим некорректный вызов процедуры
        $isAjax = $request->isXmlHttpRequest();
        if (!$isAjax) {
            $log->alert('Попытка вызова admin/series напрямую, без AJAX');
            die();
        }
        
        // Получаем код клиента из запроса и вызываем модель
        $countriesTable = new Application_Model_DbTable_Series();
        $result = $countriesTable->getSeriesForAcquire();
        
        $log->info("Был вызван admin/series напрямую методом " . ($request->isPost() ? "POST" : "GET") . ", получено записей = " . count($result));

        $this->_helper->json($result->toArray());
	}

    /**
     * (AJAX) Действие контроллера - получение списка кружек для сверки с вики
     *
	 * В запросе не требуется никакая информация. Вызывается модель, возвращающая <b>Zend_Db_Rowset</b>,
	 * который потом конвертируется в ассоциативный массив формата "Имя столбца" => "Значение".
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>mugName/li>
     * <li>mugCountryId</li>
     * <li>mugSerieId</li>
     * </ul>
	 * JSON возвращает такой массив в виде массива объектов с тремя указанными свойствами.
	 *
	 * @uses	Application_Model_DbTable_Mugs::getMugsForAcquire()
	 * @todo	ИСПРАВИТЬ ОПИСАНИЕ!!!!
     */
	public function mugsAction() {
        $log = Zend_Registry::get('log');
        
        $request = $this->getRequest();
        
		// Сначала предотвратим некорректный вызов процедуры
        $isAjax = $request->isXmlHttpRequest();
        if (!$isAjax) {
            $log->alert('Попытка вызова admin/mugs напрямую, без AJAX');
            die();
        }
        
        // Получаем код клиента из запроса и вызываем модель
        $countriesTable = new Application_Model_DbTable_Mugs();
        $result = $countriesTable->getMugsForAcquire();
        
        $log->info("Был вызван admin/mugs напрямую методом " . ($request->isPost() ? "POST" : "GET") . ", получено записей = " . count($result));

        $this->_helper->json($result->toArray());
	}
	
	    /**
     * (AJAX) Действие контроллера - добавление новой кружки
     *
	 * В запросе приходит массив с полями для новой кружки.

	 *
	 * @uses	Application_Model_DbTable_Mugs::addMug()
	 * @uses	Application_Model_DbTable_Log::writeLog()
     */
	public function addMugAction() {
		$log = Zend_Registry::get('log');
		
		$request = $this->getRequest();

		// Сначала предотвратим некорректный вызов процедуры
		$isAjax = $request->isXmlHttpRequest();
		if (!$isAjax) {
			$log->alert('Попытка вызова admin/addMug напрямую, без AJAX');
			die();
		}

		// Модели на будущее
		$mugsModel = new Application_Model_DbTable_Mugs();
		$logModel = new Application_Model_DbTable_Log();
		
		// В запросе у нас есть 3 пары "Название поля в таблице - значение".
		try {
			$params = $request->getPost();
			$mugsAdded = 0;
			//Zend_Debug::dump($params["mugs"]);
			foreach ($params["mugs"] as $mug) {
				$mugId = $mugsModel->addMug( $mug );
				$mugsAdded += 1;
					
				// Формируем строку с полями
				$logString = '';
				foreach ($mug as $key => $value) {
					$logString = (strlen($logString) == 0) ? '' : $logString . ', ';
					$logString = $logString . "{$key}: \"{$value}\"";
				}				
				// И записываем строку в лог
				$logModel->writeLog('Adding', $logString);
			}

			$result = array( 'status' => 'success', 'message' => "{$mugsAdded} mug(s) added" );
		} catch (Zend_Exception $e) {
			$this->_helper->json( array( 'status' => 'fail', 'message' => $e->getMessage() ) );
		}
		
		$this->_helper->json($result);
	}

}
