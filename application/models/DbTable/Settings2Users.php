<?php
/**
 * Модель для таблицы settings2users
 *
 * Обычный Table Gateway (Martin Fowler), дополнительная логика по минимуму
 *
 * @package		site
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 */
class Application_Model_DbTable_Settings2Users extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'settings2users';
	protected $_primary = 'id';
	/**#@-*/
	
	public function findByUserAndSetting($userId, $settingId) {
		$select = $this->select()
			->where('settingUserId = ?', $userId)
			->where('settingId = ?', $settingId);
		$row = $this->fetchRow($select);

		if ($row === NULL) {
			return NULL;
		} else {
			return $row->id;
		}
    }
    
    public function updateSettingValue($id, $newValue) {
    	$rows = $this->find($id);
    	$row = $rows->current();
    	$row->settingValue = $newValue;
    	$row->save();
    	return;
    }
    
    public function addSettingValue($userId, $settingId, $settingValue) {
    	// @TODO: Implement addSettingValue
    }
}
