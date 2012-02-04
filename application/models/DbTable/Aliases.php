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
 * Модель для таблицы aliases
 *
 * Предназначена для работы со списком синонимов, используемых в системе.
 *
 * @package		site
 * @subpackage	dbtables
 */
class Application_Model_DbTable_Aliases extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'aliases';
	protected $_primary = 'id';
	/**#@-*/

    /**
     * Получение списка синонимов для стран
     *
     * Используется для получения списка синонимов для стран. Возвращаются
     * все синонимы, так как фильтрацией должна заниматься модель более
     * высокого уровня
     *
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>aliasCountryId</li>
     * <li>aliasName</li>
     * </ul>
	 *
	 * @return	Zend_Db_Rowset			Результат запроса
     */
	public function getAliasesForCountries() {
		$select = $this->select()
					   ->from('aliases',
							  array('id',
									'aliasCountryId',
									'aliasName'))
					   ->where('aliasCountryId IS NOT NULL')
    				   ->order('aliasCountryId');
    	
    	return $this->fetchAll($select);
	}
}
