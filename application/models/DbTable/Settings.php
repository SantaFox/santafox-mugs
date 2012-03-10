<?php
/**
 * Модель для таблицы settings
 *
 * Обычный Table Gateway (Martin Fowler), дополнительной логики нет
 *
 * @package		site
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
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
