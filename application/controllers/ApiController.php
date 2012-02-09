<?php
/**
 * StarbucksMugs
 *
 * @package		site
 * @subpackage	controllers
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 * @version		$Id: ClientsController.php 168 2011-03-07 21:02:02Z santafox $
 */

/**
 * Контроллер для всех действий AJAX
 *
 * @package		site
 * @subpackage	controllers
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
        	$userSettingsTable = new Application_Model_DbTable_UserSettings();
        	$settingShowOnlyOwnMugs = $userSettingsTable->getUserSetting($userId, 'ShowOnlyOwnMugs', 'FALSE');

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
        	$userSettingsTable = new Application_Model_DbTable_UserSettings();
        	$settingShowOnlyOwnMugs = $userSettingsTable->getUserSetting($userId, 'ShowOnlyOwnMugs', 'FALSE');

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
}
