<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	controllers
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Alpha
 * @version		$Id: AssetsController.php 168 2011-03-07 21:02:02Z santafox $
 */

/**
 * Контроллер для операций со справочником ценных бумаг
 *
 * @package		dashboard
 * @subpackage	controllers
 */
class AssetsController extends Zend_Controller_Action {

    /**
     * Действие контроллера - стандартный пустой обработчик /index
     */
	public function indexAction() {

	}

	/**
     * (AJAX) Действие контроллера - получение списка бумаг для автозаполнения формы редактирования партии
     *
	 * В запросе приходит параметр <b>term</b>, используемый элементом jQueryUI.Autocomplete {@link http://jqueryui.com/demos/autocomplete/#remote}.
	 * Дальше запрашивается модель, которая возвращает все варианты поиска по подстроке в наименовании бумаги.
	 * В конце формируется векторный массив с наименованиями, ожидаемый элементом на форме.
	 *
	 * @uses	Application_Model_DbTable_ItemAssets::getAssetsByName()
	 */
	public function completionAction() {
		$log = Zend_Registry::get('log');

		$request = $this->getRequest();

		// Сначала предотвратим некорректный вызов процедуры
		$isAjax = $request->isXmlHttpRequest();
		if (!$isAjax) {
			$log->alert('Попытка вызова assets/completion напрямую, без AJAX');
			die();
		}

		// Получаем код клиента из запроса и вызываем модель
		$term = $request->getParam('term');
		$itemAssetsTable = new Application_Model_DbTable_ItemAssets();
		$result = $itemAssetsTable->getAssetsByName($term);

		$log->info("Был вызван assets/completion напрямую методом" . ($request->isPost() ? "POST" : "GET") . ", term = " . $term . ", получено записей = " . count($result));

		// Подготовка к возвращению данных
		$i = 0;
		foreach ($result as $row) {
			$output[$i] = $row->assetName;
			++$i;
		}

		$this->_helper->json($output);
	}

	/**
     * (AJAX) Действие контроллера - заполнение таблицы DataTables списком известных системе ценных бумаг
     *
	 * В запросе приходит стандартная структура DataTables.
	 * Дальше модель запрашивается два раза, с указанной подстрокой поиска и без нее.
	 * В конце формируется стандартная структура для DataTables с указанием эха, количества записей
	 * с фильтром и без него, списком полей в порядке, возвращенном моделью, и найденными данными,
	 * переобразованными в массив специального формата для DataTables.
	 *
	 * @uses	Application_Model_DbTable_ItemAssets::getAssets()
	 */
	public function dataAction() {
		$log = Zend_Registry::get('log');

		$request = $this->getRequest();

		// Сначала предотвратим некорректный вызов процедуры
		$isAjax = $request->isXmlHttpRequest();
		if (!$isAjax) {
			$log->alert('Попытка вызова assets/data напрямую, без AJAX');
			die();
		}

		// Этот параметр-счетчие используется DataTables для цепочки запрос/ответ
		$sEcho = $request->getParam('sEcho');
		$sSearch = $request->getParam('sSearch');

		// Вызываем модель
		$assetsTable = new Application_Model_DbTable_ItemAssets();
		$result = $assetsTable->getAssets($sSearch);
		$resultFull = ($sSearch == '') ? $result : $assetsTable->getAssets();

		$log->info("Был вызван assets/data методом " . ($request->isPost() ? "POST" : "GET") .
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
