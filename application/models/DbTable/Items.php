<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Alpha
 * @version		$Id: Items.php 160 2011-03-05 17:13:00Z santafox $
 */

/**
 * Модель для таблицы dashboard.items
 *
 * Предназначена для работы со списком партий и записями по отдельности.
 *
 * @package		dashboard
 * @subpackage	dbtables
 */
class Application_Model_DbTable_Items extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'items';
	protected $_primary = 'id';
	/**#@-*/

    /**
     * Возвращение развернутого списока партий
     *
     * Фильтрация по подстроке выполняется в:
     * <ul>
     * <li>наименовании ценной бумаги</li>
     * </ul>
     * Используется контроллером {@link ItemsController::dataAction()} для формирования AJAX ответа с данными для таблицы
     *
	 * @param	int		$iClientId		Идентификатор клиента
     * @param	string	$sSearch		Подстрока для поиска
     * @param	boolean	$isShowSold		Показывать проданные партии или нет
     * @return	Zend_Db_Rowset			Результат запроса
     */
	public function getItemsByClient ($iClientId, $sSearch = '', $isShowSold = false) {
		$select = $this->select()
					   ->setIntegrityCheck(false)	   // Странная идея, надо доразобраться
					   ->from('items',
					   		  array('id',
					   		  		'itemBoughtDate',
					   		  		'itemAmount',
					   		  		'itemBalanceSum',
					   		  		'itemBalancePrice' => '( itemBalanceSum / itemAmount )',
					   		  		'itemTaxSum',
					   		  		'itemTaxPrice' => '( itemTaxSum / itemAmount )',
					   		  		'itemBalancePercent' => '( ( ( quoteValue * itemAmount ) - itemBalanceSum ) / itemBalanceSum ) * 100',
					   		  		'itemTaxPercent' => '( ( ( quoteValue * itemAmount ) - itemTaxSum ) / itemTaxSum ) * 100',
					   		  		'itemBuyReason'))
					   ->join('itemAssets',
					   		  'itemAssets.id = items.itemAssetId',
					   		  array('assetName'))
					   ->join('assetQuotes',
							  'assetQuotes.quoteAssetId = items.itemAssetId',
							  array('itemMarketQuote' => 'quoteValue',
					   		  		'itemMarketSum' => '( quoteValue * itemAmount )'))
					   ->where('itemClientId = ?', (int)$iClientId)
					   ->order(array('assetName',
					   				 'itemBoughtDate',
					   				 'itemOrderNum'));

		if ($sSearch != '') {
			$select->where('assetName LIKE "%' . $sSearch . '%"');
		};

		if (!$isShowSold) {
			$select->where('itemSellDate is NULL');
		};

		return $this->fetchAll($select);
	}

    /**
     * Создание новой партии
     *
     * Должны быть заполнены необходимые поля записи:
     * <ul>
	 * <li>itemClientId</li>
	 * <li>itemAssetId</li>
	 * <li>itemBoughtDate</li>
	 * <li>itemOrderNum</li>
	 * <li>itemAmount</li>
	 * <li>itemBalanceSum</li>
	 * <li>itemTaxSum</li>
	 * <li>itemBuyReason</li>
	 * </ul>
     *
     * @throws	Zend_Exception			В случае ошибки базы данных
     * @param	array	$params			Данные для новой записи в формате "Имя поля" => "Новое значение"
     * @return	int						Идентификатор новой записи
     */
	public function addItem ($params) {
		// Теперь делаем непосредственно операцию в базе
		try {
			$itemId = $this->insert( $params );
		} catch (Zend_Exception $e) {
			// Если возникла ошибка, то надо перегенерить ее и отдать дальше
			throw new Zend_Exception ('Ошибка базы данных', -1, $e);
		}
		
		return $itemId;
	}
	
    /**
     * Исправление данных по партии
     *
     * Если $params пуст, то процедура не делает ничего и не генерит исключение
     *
     * @throws	Zend_Exception			В случае ошибки базы данных
     * @throws	Zend_Exception			В случае отсутствия указанной партии
	 * @param	int		$itemId			Идентификатор записи
     * @param	array	$params			Данные для исправления в формате "Имя поля" => "Новое значение"
     * @return	void
     */
	public function updateItem ($itemId, $params) {
		// Находим нужную запись и обрабатываем исключение
		$rows = $this->find($itemId);
		if (count($rows) == 0) {
			throw new Zend_Exception ('Запись с id = ' . $itemId . ' не найдена');
		};
		$row = $rows->current();

		// Зачем-то обрабатываем ситуацию, когда передан пустой $params
		$iChanged = count($params);
		if ( $iChanged == 0 ) {
			return 0;
		}
		
		// Теперь делаем непосредственно операцию в базе
		try {
			$row->setFromArray($params);
			$row->save();
		} catch (Zend_Exception $e) {
			// Если возникла ошибка, то надо перегенерить ее и отдать дальше
			throw new Zend_Exception ('Ошибка базы данных', -1, $e);
		}
		return;
	}

    /**
     * Удаление указанной партии
     *
     * @throws	Zend_Exception			В случае ошибки базы данных
     * @throws	Zend_Exception			В случае отсутствия указанной партии
	 * @param	int		$itemId			Идентификатор партии
     * @return	void
     */	
	public function deleteItem ($itemId) {
		// Находим нужную запись и обрабатываем исключение
		$rows = $this->find($itemId);
		if (count($rows) == 0) {
			throw new Zend_Exception ('Запись с id = ' . $itemId . ' не найдена');
		};
		$row = $rows->current();

		// Теперь делаем непосредственно операцию в базе
		try {
			$row->delete();
		} catch (Zend_Exception $e) {
			// Если возникла ошибка, то надо перегенерить ее и отдать дальше
			throw new Zend_Exception ('Ошибка базы данных', -1, $e);
		}
		return;
	}

    /**
     * Определение очередного номера партии
     *
	 * Добавляет в массив полей новое поле itemOrderNum. Для этого ищется количество записей по ключу itemClientId+itemAssetId+itemBoughtDate,
	 * и к нему прибавляется 1.
	 * Если таких записей нет - то возвращается 1.
	 *
     *
     * @param	array	$params			Данные для изменения в формате "Имя поля" => "Значение"
     * @return	array					Массив с добавленным ключом
     */	
	public function getItemOrderNum($params) {
		$select = $this->select()
						->from('items',
								 'MAX(itemOrderNum)')
						->where('itemClientId = ?', $params['itemClientId'])
						->where('itemAssetId = ?', $params['itemAssetId'])
						->where('itemBoughtDate = ?', $params['itemBoughtDate']);
		$maxOrderNum = $this->getAdapter()->fetchOne($select);
		$maxOrderNum = (is_null($maxOrderNum)) ? 0 : $maxOrderNum;
		$params['itemOrderNum'] = $maxOrderNum + 1;
		return $params;
	}

    /**
     * Возвращение записи в виде массива
     *
	 * Ищет указанную запись в таблице и возвращает ее в виде массива
	 * 
     * Используется контроллером {@link ItemsController::updateAction()} для сравнения имеющихся и новых данных
	 * и создания сокращенного массива изменившихся полей
     *
     * @throws	Zend_Exception			В случае отсутствия указанной партии
	 * @param	int		$itemId			Идентификатор партии
     * @return	array					Массив в формате "Имя поля" => "Новое значение"
     */	
	public function getItemAsArray ($itemId) {
		$rows = $this->find($itemId);
		if (count($rows) == 0) {
			throw new Zend_Exception ('Запись с id = ' . $itemId . ' не найдена');
		};
		return $rows->current()->toArray();
	}
}
