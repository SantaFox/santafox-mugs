<?php
/**
 * Starbucks Mugs
 *
 * @package		site
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Release
 * @version		$Id: UserPrefs.php 165 2011-03-07 18:07:22Z santafox $
 */

/**
 * Модель для таблицы users
 *
 * Обычный Table Gateway (Martin Fowler), дополнительной логики нет
 *
 * @package		site
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
