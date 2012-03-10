<?php
/**
 * Модель для таблицы users
 *
 * Обычный Table Gateway (Martin Fowler), дополнительной логики нет
 *
 * @package		site
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
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
