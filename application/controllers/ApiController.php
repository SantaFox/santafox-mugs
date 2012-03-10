<?php
/**
 * Контроллер для всех действий AJAX
 *
 * @package		site
 * @subpackage	controllers
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 */
class ApiController extends Zend_Controller_Action {

    /**
     * (AJAX) Действие контроллера - получение списка активных стран
     *
	 * В запросе не требуется никакая информация. Вызывается модель, возвращающая <b>Zend_Db_Rowset</b>,
	 * который потом конвертируется в ассоциативный массив формата "Имя столбца" => "Значение".
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>clientCode</li>
     * <li>clientName</li>
     * </ul>
	 * JSON возвращает такой массив в виде массива объектов с тремя указанными свойствами.
	 *
	 * @uses	Application_Model_DbTable_ItemClients::getActiveClients()
	 * @todo	ИСПРАВИТЬ ОПИСАНИЕ!!!!
     */
	public function countriesAction() {
        $log = Zend_Registry::get('log');
        
        $request = $this->getRequest();
        
		// Сначала предотвратим некорректный вызов процедуры
        $isAjax = $request->isXmlHttpRequest();
        if (!$isAjax) {
            $log->alert('Попытка вызова api/countries напрямую, без AJAX');
            die();
        }
        
        // Получаем код клиента из запроса и вызываем модель
        $countriesTable = new Application_Model_DbTable_Countries();
        
        // ВНИМАНИЕ!!! ЭТО НЕПРАВИЛЬНО С ТОЧКИ ЗРЕНИЯ API - КАЖДЫЙ ВЫЗОВ ДОЛЖЕН ИМЕТЬ ПОЛНУЮ ИНФОРМАЦИЮ
        // И НИКАК НЕ ЗАВИСЕТЬ ОТ СЕССИИ БРАУЗЕРА!
        $auth = Zend_Auth::getInstance();
        if ( $auth->hasIdentity() ) {
        	$userId = $auth->getIdentity()->id;
        	$settingsModel = new Application_Model_Settings();
        	$settingShowOnlyOwnMugs = $settingsModel->getUserSetting($userId, 'ShowOnlyOwnMugs');
        	$settingShowMugsCount = $settingsModel->getUserSetting($userId, 'ShowMugsCount');

        	if ( $settingShowOnlyOwnMugs == 'TRUE' ) {
        		$result = $countriesTable->getCountriesCloud($userId);
        	} else {
        		$result = $countriesTable->getCountriesCloud();
        	}
        } else {
        	$result = $countriesTable->getCountriesCloud();
    	}

        $log->info("Был вызван api/countries напрямую методом " . ($request->isPost() ? "POST" : "GET") . ", получено записей = " . count($result));

        $this->_helper->json($result->toArray());
	}
	
    /**
     * (AJAX) Действие контроллера - получение списка активных серий
     *
	 * В запросе не требуется никакая информация. Вызывается модель, возвращающая <b>Zend_Db_Rowset</b>,
	 * который потом конвертируется в ассоциативный массив формата "Имя столбца" => "Значение".
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>serieName</li>
     * <li>mugsCount</li>
     * </ul>
	 * JSON возвращает такой массив в виде массива объектов с тремя указанными свойствами.
	 *
	 * @uses	Application_Model_DbTable_ItemClients::getActiveClients()
	 * @todo	ИСПРАВИТЬ ОПИСАНИЕ!!!!
     */
	public function seriesAction() {
        $log = Zend_Registry::get('log');
        
        $request = $this->getRequest();
        
		// Сначала предотвратим некорректный вызов процедуры
        $isAjax = $request->isXmlHttpRequest();
        if (!$isAjax) {
            $log->alert('Попытка вызова api/series напрямую, без AJAX');
            die();
        }
        
        // Получаем код клиента из запроса и вызываем модель
        $seriesTable = new Application_Model_DbTable_Series();
        $result = $seriesTable->getSeriesCloud();
        
        $log->info("Был вызван api/series напрямую методом " . ($request->isPost() ? "POST" : "GET") . ", получено записей = " . count($result));

        $this->_helper->json($result->toArray());
	}
	
    /**
     * (AJAX) Действие контроллера - получение списка кружек
     *
	 * В запросе не требуется никакая информация. Вызывается модель, возвращающая <b>Zend_Db_Rowset</b>,
	 * который потом конвертируется в ассоциативный массив формата "Имя столбца" => "Значение".
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>serieName</li>
     * <li>mugsCount</li>
     * </ul>
	 * JSON возвращает такой массив в виде массива объектов с тремя указанными свойствами.
	 *
	 * @uses	Application_Model_DbTable_ItemClients::getActiveClients()
	 * @todo	ИСПРАВИТЬ ОПИСАНИЕ!!!!
     */
	public function mugsAction() {
        $log = Zend_Registry::get('log');
        
        $request = $this->getRequest();
        
		// Сначала предотвратим некорректный вызов процедуры
        $isAjax = $request->isXmlHttpRequest();
        if (!$isAjax) {
            $log->alert('Попытка вызова api/mugs напрямую, без AJAX');
            die();
        }

        // Разбор переданных параметров
		$countryId = $request->getParam('countryId');
		$serieId = $request->getParam('serieId');

        // Получаем код клиента из запроса и вызываем модель
        $mugsTable = new Application_Model_DbTable_Mugs();
        
        // ВНИМАНИЕ!!! ЭТО НЕПРАВИЛЬНО С ТОЧКИ ЗРЕНИЯ API - КАЖДЫЙ ВЫЗОВ ДОЛЖЕН ИМЕТЬ ПОЛНУЮ ИНФОРМАЦИЮ
        // И НИКАК НЕ ЗАВИСЕТЬ ОТ СЕССИИ БРАУЗЕРА!
        $auth = Zend_Auth::getInstance();
        if ( $auth->hasIdentity() ) {
        	$userId = $auth->getIdentity()->id;
        	$settingsModel = new Application_Model_Settings();
        	$settingShowOnlyOwnMugs = $settingsModel->getUserSetting($userId, 'ShowOnlyOwnMugs');

        	if ( $settingShowOnlyOwnMugs == 'TRUE' ) {
        		$result = $mugsTable->getMugsList($countryId, $serieId, $userId);
        	} else {
        		$result = $mugsTable->getMugsList($countryId, $serieId);
        	}
        } else {
        	$result = $mugsTable->getMugsList($countryId, $serieId);
    	}
        
        $log->info("Был вызван api/mugs напрямую методом " . ($request->isPost() ? "POST" : "GET") . ", получено записей = " . count($result));

        $this->_helper->json($result->toArray());
	}

    /**
     * (AJAX) Действие контроллера -  разбор и запись настроек пользователя
     *
	 * Процедура получает набор настроек, загружает текущий список настроек (для сверки)
	 * и записывает обратно. Мы стараемся не оставлять "дефолтных" настроек, то есть все
	 * настройки пользователя должны иметь значение. Сделано это для того, чтобы при изменении
	 * дефолтной настройки параметры уже зарегестрированных пользователей не "поехали"
	 *
	 * @uses	Application_Model_Settings::getUserSettings()
	 * @uses	Application_Model_Settings::setUserSetting()
	 *
	 * @return	array	Стандартный объект с полями status (success/fail) и message
     */
	public function updateSettingsAction() {
        $log = Zend_Registry::get('log');
        
        $request = $this->getRequest();
        
		// Сначала предотвратим некорректный вызов процедуры
        $isAjax = $request->isXmlHttpRequest();
        if (!$isAjax) {
            $log->alert('Попытка вызова api/updateSettings напрямую, без AJAX');
            die();
        }

		// Загружаем имеющиеся параметры пользователя
		$auth = Zend_Auth::getInstance();
       	$userId = $auth->getIdentity()->id;
       	$settingsModel = new Application_Model_Settings();
       	$userSettings = $settingsModel->getUserSettings($userId);
       	
       	$substTable = array(
       		'on' => 'TRUE',
       		'off' => 'FALSE'
       	);
       	
       	$settingsUpdated = 0;
       	foreach ($userSettings as $key=>$setting) {
       		$paramValue = $request->getParam('user' . $key);
       		$newValue = $substTable[$paramValue];
       		if ( $newValue != $setting ) {
       			$settingsModel->setUserSetting($userId, $key, $newValue);
       			$settingsUpdated += 1;
       		}
       	}
		
		$result = array( 'status' => 'success', 'message' => "{$settingsUpdated} user settings updated successfully" );
		$this->_helper->json($result);
	}
}