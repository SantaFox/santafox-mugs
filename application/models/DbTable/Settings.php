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
 * Модель для таблицы settings
 *
 * Обычный Table Gateway (Martin Fowler), дополнительной логики нет
 *
 * @package		site
 * @subpackage	dbtables
 */
class Application_Model_DbTable_Settings extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'settings';
	protected $_primary = 'id';
	/**#@-*/

	public function getIdByName($settingName)
	{
	    $where = $this->getAdapter()->quoteInto('settingName = ?', $settingName);
	    $rowset = $this->fetchAll($where);
	    if (count($rowset) == 0) {
	    	throw new Zend_Exception ('Запись с settingName = "' . $settingName . '" не найдена');
	    };
	    $row = $rowset->current();
	    
	    return $row->id;
	}

}
