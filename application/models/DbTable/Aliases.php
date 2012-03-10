<?php
/**
 * Модель для таблицы aliases
 *
 * Обычный Table Gateway (Martin Fowler), дополнительной логики нет
 *
 * @package		site
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
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

    /**
     * Получение списка синонимов для серий
     *
     * Используется для получения списка синонимов для серий. Возвращаются
     * все синонимы, так как фильтрацией должна заниматься модель более
     * высокого уровня
     *
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>aliasSerieId</li>
     * <li>aliasName</li>
     * </ul>
	 *
	 * @return	Zend_Db_Rowset			Результат запроса
     */
	public function getAliasesForSeries() {
		$select = $this->select()
					   ->from('aliases',
							  array('id',
									'aliasSerieId',
									'aliasName'))
					   ->where('aliasSerieId IS NOT NULL')
    				   ->order('aliasSerieId');
    	
    	return $this->fetchAll($select);
	}
}
