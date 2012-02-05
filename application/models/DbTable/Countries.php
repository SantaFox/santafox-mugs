<?php
/**
 * Starbucks Mugs
 *
 * @package		site
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 * @version		$Id: ItemClients.php 178 2011-03-11 18:01:05Z santafox $
 */

/**
 * Модель для таблицы countries
 *
 * Предназначена для работы со списком стран, используемых в системе.
 *
 * @package		site
 * @subpackage	dbtables
 */
class Application_Model_DbTable_Countries extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'countries';
	protected $_primary = 'id';
	/**#@-*/

    /**
     * Получение списка стран для облака
     *
     * Используется для получения списка стран с количество кружек, при
     * возможной фильтрации по пользователю и/или серии. Страны с количеством кружек = 0
     * не возвращаются.
     *
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>countryName</li>
     * <li>mugsCount</li>
     * </ul>
	 *
	 * @param	null|string	$userId		id пользователя для фильтрации
	 * @param	null|string	$serieId	id серии для фильтрации
	 * @return	Zend_Db_Rowset			Результат запроса
     */
	public function getCountriesCloud($userId = '', $serieId = '') {
		$select = $this->select()
		               ->setIntegrityCheck(false)      // Странная идея, надо доразобраться
					   ->from('countries',
							  array('id',
									'countryName'))
					   ->join('mugs',
					   		  'countries.id = mugs.mugCountryId',
					   		  array('mugsCount' => 'COUNT(*)'))
					   ->group('countries.id')
    				   ->order('countryName');
        
        if ($serieId != '') {
            $select->where('mugSerieId = ?', (int)$serieId);
        }
    	
    	return $this->fetchAll($select);
	}

    /**
     * Получение списка всех зарегестрированных в системе стран с их синонимами для сравнение с вики
     *
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>countryName</li>
     * </ul>
	 *
     * @return	Zend_Db_Rowset			Результат запроса
     */
	public function getCountriesForAcquire() {
		$select = $this->select()
					   ->from('countries',
							  array('id',
									'countryName'));

    	return $this->fetchAll($select);
	}

}
