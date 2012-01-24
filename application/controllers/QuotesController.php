<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	controllers
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Alpha
 * @version		$Id: QuotesController.php 168 2011-03-07 21:02:02Z santafox $
 */

/**
 * Контроллер для операций с котировками
 *
 * @package		dashboard
 * @subpackage	controllers
 */
class QuotesController extends Zend_Controller_Action {

    /**
     * Действие контроллера - стандартный пустой обработчик /index
     */
	public function indexAction() {

	}

	/**
     * (AJAX) Действие контроллера - заполнение таблицы DataTables списком текущих котировок
     *
	 * В запросе приходит стандартная структура DataTables.
	 * Дальше модель запрашивается два раза, с указанной подстрокой поиска и без нее.
	 * В конце формируется стандартная структура для DataTables с указанием эха, количества записей
	 * с фильтром и без него, списком полей в порядке, возвращенном моделью, и найденными данными,
	 * переобразованными в массив специального формата для DataTables.
	 *
	 * @uses	Application_Model_DbTable_AssetQuotes::getQuotes()
	 */
	public function dataAction() {
		$log = Zend_Registry::get('log');
		
		$request = $this->getRequest();
		
		// Сначала предотвратим некорректный вызов процедуры
		$isAjax = $request->isXmlHttpRequest();
		if (!$isAjax) {
			$log->alert('Попытка вызова quotes/data напрямую, без AJAX');
			die();
		}
		
		// Этот параметр-счетчие используется DataTables для цепочки запрос/ответ
		$sEcho = $request->getParam('sEcho');
		$sSearch = $request->getParam('sSearch');
				
		// Вызываем модель
		$quotesTable = new Application_Model_DbTable_AssetQuotes();
		$result = $quotesTable->getQuotes($sSearch);
		$resultFull = ($sSearch == '') ? $result : $quotesTable->getQuotes();
		
		$log->info("Был вызван quotes/data методом " . ($request->isPost() ? "POST" : "GET") .
					"', sSearch = '" . $sSearch . "', получено записей = " . count($result));
		
		// Подготовка к возвращению данных
		$rowsetArray = $result->toArray();
		$aaData = array();
		$i = 0;
		foreach ($rowsetArray as $rowArray) {
			$aaData[$i] = array();
			$j = 0;				
			foreach ($rowArray as $column => $value) {
				$aaData[$i][$j] = $value;
				++$j;
			}
			++$i;
		}
		$columnNames = ( count($rowsetArray) == 0 ) ? '' : implode(',', array_keys(current($rowsetArray)));
		$output = array(
			"sEcho" => $sEcho,
			"iTotalRecords" => count($result),
			"iTotalDisplayRecords" => count($resultFull),
			"sColumns" => $columnNames,
			"aaData" => $aaData
		);
		
		$this->_helper->json($output);
	}

}
