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
 * Контроллер для операций со странами
 *
 * @package		site
 * @subpackage	controllers
 */
class ClientsController extends Zend_Controller_Action {

    /**
     * Действие контроллера - стандартный пустой обработчик /index
     */
	public function indexAction() {

	}

    /**
     * (AJAX) Действие контроллера - получение списка активных клиентов
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
     */
	public function listAction() {
        $log = Zend_Registry::get('log');
        
        $request = $this->getRequest();
        
		// Сначала предотвратим некорректный вызов процедуры
        $isAjax = $request->isXmlHttpRequest();
        if (!$isAjax) {
            $log->alert('Попытка вызова clients/list напрямую, без AJAX');
            die();
        }
        
        // Получаем код клиента из запроса и вызываем модель
        $itemClientsTable = new Application_Model_DbTable_ItemClients();
        $result = $itemClientsTable->getActiveClients();
        
        $log->info("Был вызван clients/list напрямую методом " . ($request->isPost() ? "POST" : "GET") . ", получено записей = " . count($result));

        $this->_helper->json($result->toArray());
	}
}

