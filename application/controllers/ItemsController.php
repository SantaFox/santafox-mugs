<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	controllers
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Alpha
 * @version		$Id: ItemsController.php 177 2011-03-11 11:53:37Z santafox $
 */

/**
 * Контроллер для операций с партиями
 *
 * @package		dashboard
 * @subpackage	controllers
 */
class ItemsController extends Zend_Controller_Action {

	private function pluralForm($n, $forms) {
  		return $n%10==1&&$n%100!=11?$forms[0]:($n%10>=2&&$n%10<=4&&($n%100<10||$n%100>=20)?$forms[1]:$forms[2]);
	}

    /**
     * Действие контроллера - стандартный пустой обработчик /index
	 *
	 * Дополнительным действием читаем ACL из модели и отдаем его шаблону, чтобы он
	 * соответственно заблокировал недоступные кнопки. Но система корява, надо придумать
	 * что-нибудь поэлегантнее.
     */
	public function indexAction() {
		$this->view->acl = Application_Model_Acl::getACL();
	}

	/**
     * (AJAX) Действие контроллера - заполнение таблицы DataTables списком партий
     *
	 * В запросе приходит стандартная структура DataTables плюс пользовательское поле <b>clientId</b>.
	 * Дальше модель запрашивается два раза, с указанной подстрокой поиска и без нее.
	 * В конце формируется стандартная структура для DataTables с указанием эха, количества записей
	 * с фильтром и без него, списком полей в порядке, возвращенном моделью, и найденными данными,
	 * переобразованными в массив специального формата для DataTables.
	 *
	 * @uses	Application_Model_DbTable_Items::getItemsByClient()
	 */
	public function dataAction() {
		$log = Zend_Registry::get('log');
		
		$request = $this->getRequest();
		
		// Сначала предотвратим некорректный вызов процедуры
		$isAjax = $request->isXmlHttpRequest();
		if (!$isAjax) {
			$log->alert('Попытка вызова items/data напрямую, без AJAX');
			die();
		}
		
		// Модели на будущее
		$itemsModel = new Application_Model_DbTable_Items();

		// Разбор переданных параметров
		$sEcho = $request->getParam('sEcho');		// Этот параметр-счетчик используется DataTables для цепочки запрос/ответ
		$sSearch = $request->getParam('sSearch');
		$clientId = $request->getParam('clientId');

		// Делаем два запроса, с фильтром и без
		$result = $itemsModel->getItemsByClient($clientId, $sSearch);
		$resultFull = ($sSearch == '') ? $result : $itemsModel->getItemsByClient($clientId);
		
		$log->info("Был вызван items/data методом " . ($request->isPost() ? "POST" : "GET") .
					", clientId = '" . $clientId . "', sSearch = '" . $sSearch . "', получено записей = " . count($result));
		
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

    /**
     * (AJAX) Действие контроллера - исправление информации о партии
     *
	 * В запросе приходит массив с полями для партии.
	 * В массиве заменяется наименование бумаги на ее идентификатор, и если бумага не находится - то генерится исключение.
	 * После этого из модели считывается аналогичный массив текущих параметров, они сравниваются, и создается массив измененных параметров.
	 * Если измененных параметров нет, это считается нормальным выполнением действия.
	 * Если измененные параметры есть, то вызывается модель для выполненения изменения полей.
	 * В сообщении AJAX возвращается количество измененных записей.
	 *
	 * @uses	Application_Model_DbTable_ItemAssets::replaceAssetNameById()
	 * @uses	Application_Model_DbTable_Items::getItemAsArray()
	 * @uses	Application_Model_DbTable_Items::updateItem()
	 * @uses	Application_Model_DbTable_Log::writeLog()
     */
	public function updateAction() {
		$log = Zend_Registry::get('log');
		
		$request = $this->getRequest();

		// Сначала предотвратим некорректный вызов процедуры
		$isAjax = $request->isXmlHttpRequest();
		if (!$isAjax) {
			$log->alert('Попытка вызова items/update напрямую, без AJAX');
			die();
		}

		// Модели на будущее
		$assetsModel = new Application_Model_DbTable_ItemAssets();
		$itemsModel = new Application_Model_DbTable_Items();
		$logModel = new Application_Model_DbTable_Log();

		// В запросе у нас есть 5 пар "Название поля в таблице - значение".
		// Правда пока нам это все равно ничего не дает, так как бумагу надо отследить по имени, а это лишний запрос.
		try {
			$params = $assetsModel->replaceAssetNameById( $request->getPost() );
		} catch (Zend_Exception $e) {
			$this->_helper->json( array( 'status' => 'fail', 'message' => $e->getMessage() ) );
		}
		
		// Теперь надо получить текущее состояние записи
		$itemId = $params['id'];
		$current = $itemsModel->getItemAsArray( $itemId );
		
		// Определить изменяемые поля и их количество
		$changed = array_diff_assoc($params, $current);
		$iChanged = count($changed);
		
		// И запросить модель на изменение только измененных полей
		if ( $iChanged == 0 ) {
			$this->_helper->json( array( 'status' => 'status', 'message' => 'Запись не изменилась' ) );
		} else {
			try {
				$itemsModel->updateItem( $itemId, $changed );
				
				// Формируем строку с измененными полями
				$logString = '';
				foreach ($changed as $key => $value) {
					$logString = (strlen($logString) == 0) ? '' : $logString . ', ';
					$logString = $logString . "{$key}: \"{$current[$key]}\" => \"{$value}\"";
				}
				
				// И записываем строку в лог
				$logModel->writeLog('Обновление', $logString);
				
				$result = array( 'status' => 'success', 'message' => "Обновлено {$iChanged} " . $this->pluralForm($iChanged, array('поле', 'поля', 'полей')) );
			} catch (Zend_Exception $e) {
				$this->_helper->json( array( 'status' => 'fail', 'message' => $e->getMessage() ) );
			}
		}
		$this->_helper->json($result);
	}	 

    /**
     * (AJAX) Действие контроллера - удалений одной партии
     *
	 * В запросе приходит идентификатор партии для удаления.
	 *
	 * @uses	Application_Model_DbTable_Items::deleteItem()
	 * @uses	Application_Model_DbTable_Log::writeLog()
     */
	public function deleteAction() {
		$log = Zend_Registry::get('log');
		
		$request = $this->getRequest();
		$post = $request->getPost();
		$id = $post['id'];

		// Сначала предотвратим некорректный вызов процедуры
		$isAjax = $request->isXmlHttpRequest();
		if (!$isAjax) {
			$log->alert('Попытка вызова items/delete напрямую, без AJAX');
			die();
		}
		
		// Модели на будущее
		$itemsModel = new Application_Model_DbTable_Items();
		$logModel = new Application_Model_DbTable_Log();
		
		// Все готово, вызываем модель
		try {
			$itemsModel->deleteItem( $id );
				
			// И записываем строку в лог
			$logModel->writeLog('Удаление', "Запись с id = {$id}");
				
			$result = array( 'status' => 'success', 'message' => "Удалена запись с ключом {$id}" );
		} catch (Zend_Exception $e) {
			$this->_helper->json( array( 'status' => 'fail', 'message' => $e->getMessage() ) );
		}
		
		$this->_helper->json($result);
	}

    /**
     * (AJAX) Действие контроллера - добавление новой партии
     *
	 * В запросе приходит массив с полями для новой партии.
	 * В массиве заменяется наименование бумаги на ее идентификатор, и если бумага не находится - то генерится исключение.
	 * После этого вычисляется порядок партии на основаниие ключа Клиент-Бумага-Дата.
	 *
	 * @uses	Application_Model_DbTable_ItemAssets::replaceAssetNameById()
	 * @uses	Application_Model_DbTable_Items::getItemOrderNum()
	 * @uses	Application_Model_DbTable_Items::addItem()
	 * @uses	Application_Model_DbTable_Log::writeLog()
     */
	public function addAction() {
		$log = Zend_Registry::get('log');
		
		$request = $this->getRequest();

		// Сначала предотвратим некорректный вызов процедуры
		$isAjax = $request->isXmlHttpRequest();
		if (!$isAjax) {
			$log->alert('Попытка вызова items/add напрямую, без AJAX');
			die();
		}

		// Модели на будущее
		$assetsModel = new Application_Model_DbTable_ItemAssets();
		$itemsModel = new Application_Model_DbTable_Items();
		$logModel = new Application_Model_DbTable_Log();
		
		// В запросе у нас есть 5 пар "Название поля в таблице - значение".
		// Правда пока нам это все равно ничего не дает, так как бумагу надо отследить по имени, а это лишний запрос.
		try {
			$params = $assetsModel->replaceAssetNameById( $request->getPost() );
		} catch (Zend_Exception $e) {
			$this->_helper->json( array( 'status' => 'fail', 'message' => $e->getMessage() ) );
		}

		// Теперь надо добавить в массив порядок партии itemOrderNum
		try {
			$params = $itemsModel->getItemOrderNum( $params );
		} catch (Zend_Exception $e) {
			$this->_helper->json( array( 'status' => 'fail', 'message' => $e->getMessage() ) );
		}		

		// Все готово, вызываем модель
		try {
			$itemId = $itemsModel->addItem( $params );
				
			// Формируем строку с полями
			$logString = '';
			foreach ($params as $key => $value) {
				$logString = (strlen($logString) == 0) ? '' : $logString . ', ';
				$logString = $logString . "{$key}: \"{$value}\"";
			}
				
			// И записываем строку в лог
			$logModel->writeLog('Добавление', $logString);
				
			$result = array( 'status' => 'success', 'message' => "Добавлена запись с ключом {$itemId}" );
		} catch (Zend_Exception $e) {
			$this->_helper->json( array( 'status' => 'fail', 'message' => $e->getMessage() ) );
		}
		
		$this->_helper->json($result);
	}

}
