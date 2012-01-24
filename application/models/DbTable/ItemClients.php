<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Alpha
 * @version		$Id: ItemClients.php 178 2011-03-11 18:01:05Z santafox $
 */

/**
 * Модель для таблицы dashboard.itemClients
 *
 * Предназначена для работы со списком клиентов, используемых в системе.
 *
 * @package		dashboard
 * @subpackage	dbtables
 */
class Application_Model_DbTable_ItemClients extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'itemClients';
	protected $_primary = 'id';
	/**#@-*/

    /**
     * Получение списка активных клиентов
     *
     * Используется для формирования списка закладок в окне партий.
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>clientCode</li>
     * <li>clientName</li>
     * </ul>
     * @todo	Сделать проверку на доступность клиентов пользователю
     * @todo	Сделать контроль закрытых клиентов
	 *
     * @return	Zend_Db_Rowset			Результат запроса
     */
	public function getActiveClients() {
		$select = $this->select()
					   ->from('itemClients',
							  array('id',
									'clientCode',
									'clientName'))
					   ->where('clientCloseDate IS NULL')
    				   ->order('clientCode');

    	return $this->fetchAll($select);
	}

}
