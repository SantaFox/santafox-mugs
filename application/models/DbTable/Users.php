<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Beta
 * @version		$Id: Users.php 160 2011-03-05 17:13:00Z santafox $
 */

/**
 * Модель для таблицы dashboard.users
 *
 * Предназначена работы со списком пользователей и ролей.
 *
 * @package		dashboard
 * @subpackage	dbtables
 */
class Application_Model_DbTable_Users extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'users';
	protected $_primary = 'id';
	/**#@-*/
}
