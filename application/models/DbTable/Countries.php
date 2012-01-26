<?php
/**
 * PEKO-M Dashboard
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
     * Получение списка всех зарегестрированных в системе стран
     *
     * Используется для указания страны пользователя и во всех окнах,
     * где показывается коллекция
     *
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>countryName</li>
     * </ul>
	 *
     * @return	Zend_Db_Rowset			Результат запроса
     */
	public function getCountries() {
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

    	return $this->fetchAll($select);
	}

}
