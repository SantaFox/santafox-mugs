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
 * Модель для таблицы series
 *
 * Предназначена для работы со списком серий, используемых в системе.
 *
 * @package		site
 * @subpackage	dbtables
 */
class Application_Model_DbTable_Series extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'series';
	protected $_primary = 'id';
	/**#@-*/

    /**
     * Получение списка серий для облака
     *
     * Используется для получения списка серий с количество кружек, при
     * возможной фильтрации по пользователю и/или стране. Серии с количеством кружек = 0
     * не возвращаются.
     *
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>serieName</li>
     * <li>mugsCount</li>
     * </ul>
	 *
	 * @param	null|string	$userId		id пользователя для фильтрации
	 * @param	null|string	$countryId	id страны для фильтрации
	 * @return	Zend_Db_Rowset			Результат запроса
     */
	public function getSeriesCloud($userId = '', $countryId = '') {
		$select = $this->select()
		               ->setIntegrityCheck(false)      // Странная идея, надо доразобраться
					   ->from('series',
							  array('id',
									'serieName'))
					   ->join('mugs',
					   		  'series.id = mugs.mugSerieId',
					   		  array('mugsCount' => 'COUNT(*)'))
					   ->group('series.id')
    				   ->order('serieName')
    				   ->having('mugsCount > 0');
        
        if ($serieId != '') {
            $select->where('mugCountryId = ?', (int)$serieId);
        }
    	
    	return $this->fetchAll($select);
	}

    /**
     * Получение списка всех зарегестрированных в системе серий с их синонимами для сравнение с вики
     *
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>serieName</li>
     * <li>serieAcquireAlias</li>
     * </ul>
	 *
     * @return	Zend_Db_Rowset			Результат запроса
     */
	public function getSeriesForAcquire() {
		$select = $this->select()
					   ->from('series',
							  array('id',
									'serieName',
									'serieAcquireAlias'));

    	return $this->fetchAll($select);
	}

}
