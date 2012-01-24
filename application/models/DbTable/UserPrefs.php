<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Release
 * @version		$Id: UserPrefs.php 165 2011-03-07 18:07:22Z santafox $
 */

/**
 * Модель для таблицы dashboard.userPrefs
 *
 * Предназначена работы с коллекцией настроек пользователя.
 *
 * @package		dashboard
 * @subpackage	dbtables
 */
class Application_Model_DbTable_UserPrefs extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'userPrefs';
	protected $_primary = 'id';
	/**#@-*/
}
