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
 * Модель для таблицы userSettings
 *
 * Предназначена работы с коллекцией настроек пользователя.
 *
 * @package		site
 * @subpackage	dbtables
 */
class Application_Model_DbTable_UserSettings extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'userSettings';
	protected $_primary = 'id';
	/**#@-*/

    /**
     * Получение списка настроек для пользователя. Если конкретный параметр не указан, то
     * возвращаются все установленные параметры. Если параметр указан, но в базе не определен,
     * то возвращается его дефолтовое значение. Если оно не установлено, то возвращается null
     *
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>countryName</li>
     * </ul>
	 *
     * @param	int	$userId					Идентификатор пользователя
     * @return	Zend_Db_Rowset				Результат запроса
     */
	public function getUserSettings($userId) {
		$select = $this->select()
					   ->from('userSettings',
							  array('settingName',
									'settingValue'))
					   ->where('settingUserId = ?', (int)$userId)
					   ->order('settingName');

    	return $this->fetchAll($select);
	}
	
    /**
     * Получение определенного параметра для пользователя. Если параметр базе не определен,
     * то возвращается его дефолтовое значение. Если оно не установлено, то возвращается null
	 *
     * @param	int	$userId					Идентификатор пользователя
     * @param	string $settingName			Наименование определенного параметра
     * @param	string $settingDefaultValue	Дефолтовое значение параметра
     * @return	null|string					Значение параметра
     */
	public function getUserSetting($userId, $settingName, $settingDefaultValue=NULL) {
		$select = $this->select()
					   ->from('userSettings',
							  array('settingName',
									'settingValue'))
					   ->where('settingUserId = ?', (int)$userId)
					   ->where('settingName = ?', $settingName);
		$result = $this->fetchRow($select);

		if ( isset($result) ) {
			return $result['settingValue'];
		} else {
			return $settingDefaultValue;
		}
	}

}
