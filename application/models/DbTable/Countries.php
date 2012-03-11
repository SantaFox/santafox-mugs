<?php
/**
 * Модель для таблицы countries
 *
 * Предназначена для работы со списком стран, используемых в системе.
 *
 * @package		site
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
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
     * возможной фильтрации по пользователю и/или серии. Всегда возвращается полный список стран
     * Если пользователь не указан, то в столбце mugsUserCount возвращается NULL
     *
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>countryName</li>
     * <li>mugsCountryCount</li>
     * <li>mugsUserCount</li>
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
					   		  array('mugsCountryCount' => 'COUNT(mugs.id)') )
					   ->group('countries.id')
    				   ->order('countryName');
        
        if ($userId != '') {
        	$select->joinLeft('mugs2users',
        				  'mugs.id = mugs2users.mugId AND mugs2users.mugUserId = ' . $userId,
        				  array('mugsUserCount' => 'COUNT(mugs2users.id)') );
        } else {
        	$select->columns(array('mugsUserCount' => 'NULL'));
        }

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
