<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Alpha
 * @version		$Id: ItemAssets.php 160 2011-03-05 17:13:00Z santafox $
 */

/**
 * Модель для таблицы dashboard.itemAssets
 *
 * Предназначена для работы со списко доступных ценных бумаг.
 *
 * @package		dashboard
 * @subpackage	dbtables
 */
class Application_Model_DbTable_ItemAssets extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'itemAssets';
	protected $_primary = 'id';
	/**#@-*/

    /**
     * Получение векторного списка бумаг
     *
     * Возвращает поле <b>assetName</b>, отсортированное по алфавиту. Используется для автоподстановки в форме редактирования партии.
     *
     * @param	null|string	$startsWith		Подстрока для фильтрации списка бумаг
     * @return	Zend_Db_Rowset				Результат запроса
     */
    public function getAssetsByName ($startsWith = '') {
        $select = $this->select()
                       ->from('itemAssets',
                              array('assetName'))
                        ->order('assetName');
        
        if ($startsWith != '') {
            $select->where('assetName LIKE "%' . $startsWith . '%"');
        }

        return $this->fetchAll($select);
    }

    /**
     * Получение идентификатора бумаги по ее названию
     *
     * Если бумага не найдена, или найдено больше одной - то возвращается 0
     * @todo	Оформить нахождение двух бумаг как исключение
     *
     * @param	string	$assetName		Полное наименование ценной бумаги (dashboard.itemAssets.assetName)
     * @return	int						Идентификатор бумаги либо 0
     */
    public function getAssetIdByName ($assetName) {
        $select = $this->select()
                       ->where('assetName = ?', $assetName);
        $rowset = $this->fetchAll($select);         // Делаем так чтобы отловить ошибочную ситуацию с двумя бумагами
        $rowCount = count($rowset);
        
        $assetId = 0;                               // Это означает что мы ничего не нашли
        if ($rowCount == 1) {
            $assetId = $rowset->current()->id;
        };
        
        return (int)$assetId;
    }

    /**
     * Заменяет в массиве параметров наименование ценной бумаги ее идентификатором
     *
	 * Находит в массиве параметров поле <b>assetName</b>, находит в базе идентификатор этой бумаги,
	 * после чего заменяет значение массива <b>assetName</b> на <b>itemAssetId</b>.
	 *
     * @throws	Zend_Exception			В случае отсутствия в базе бумаги с указанным именем
     * @param	array	$params			Данные для изменения в формате "Имя поля" => "Значение"
     * @return	array					Массив с добавленным ключом
     */	
	public function replaceAssetNameById ($params) {
		if ( !array_key_exists('assetName', $params) ) {
			return $params;
		};
		
		$assetName = $params["assetName"];
		$itemAssetId = $this->getAssetIdByName( $assetName );
		if ($itemAssetId == 0) {
			throw new Zend_Exception('Бумага не найдена');
		};
		
		// Заменяем пару assetName на полученную itemAssetId
		unset($params["assetName"]);
		$params["itemAssetId"] = $itemAssetId;
		return $params;
	}
	
    /**
     * Возвращение развернутого списока ценных бумаг
     *
     * Фильтрация по подстроке выполняется в:
     * <ul>
     * <li>наименовании ценной бумаги</li>
     * <li>наименовании отрасли</li>
     * <li>наименовании вида ценной бумаги</li>
     * <li>наименовании ЦБ на ММВБ</li>
     * <li>коде ЦБ на ММВБ</li>
     * </ul>
     * Используется контроллером {@link AssetsController::dataAction()} для формирования AJAX ответа с данными для таблицы
     *
     * @param	string	$sSearch		Подстрока для поиска
     * @return	Zend_Db_Rowset			Результат запроса
     */
    public function getAssets ($sSearch = '') {
        $select = $this->select()
                       ->setIntegrityCheck(false)      // Странная идея, надо доразобраться
                       ->from('itemAssets',
                       		  array('id',
                       		  		'assetName',
                       		  		'assetNameMICEX',
                                    'assetCodeMICEX'))
                       ->join('assetClasses',
                       		  'assetClasses.id = itemAssets.assetClassId',
                       		  array('className'))
                       ->join('assetIndustries',
                              'assetIndustries.id = itemAssets.assetIndustryId',
                              array('industryName',
                       		  		'industryRGB'))
                       ->order(array('assetName'));

		if ($sSearch != '') {
			$select->where('assetName LIKE "%' . $sSearch . '%"')
				   ->orWhere('industryName LIKE "%' . $sSearch . '%"')
				   ->orWhere('className LIKE "%' . $sSearch . '%"')
				   ->orWhere('assetNameMICEX LIKE "%' . $sSearch . '%"')
				   ->orWhere('assetCodeMICEX LIKE "%' . $sSearch . '%"');
        }
                       
        return $this->fetchAll($select);
    }
}
