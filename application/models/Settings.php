<?php
/**
 * StarbucksMugs
 *
 * @package		site
 * @subpackage	models
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 * @version		$Id$
 */

/**
 * Модель для работы с настройками пользователя
 *
 * Данная модель является более высоким уровнем для соответствующей модели по работа с соответствующими таблицами базы данных.
 * Моделями базы данных не рекомендуется пользоваться без серьезной причины.
 * TODO: 
 *
 * @package		site
 * @subpackage	models
 */
class Application_Model_Settings {

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
		$db = Zend_Db_Table::getDefaultAdapter();
		$select = $db->select()
					 ->from('settings',
							array('settingName',
								  'settingValue' => new Zend_Db_Expr('CASE WHEN settingValue IS NOT NULL THEN settingValue ELSE settingDefault END')))
					 ->joinLeft('settings2users',
					   		  	'settings.id = settings2users.settingId AND settings2users.settingUserId = ' . $userId,
					   		  	array() )
					 ->order('settingName');

		$result = $db->fetchPairs($select);

    	return $result;
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
	public function getUserSetting($userId, $settingName) {
		$db = Zend_Db_Table::getDefaultAdapter();
		$select = $db->select()
					   ->from('settings',
							  array('settingValue' => new Zend_Db_Expr('CASE WHEN settingValue IS NOT NULL THEN settingValue ELSE settingDefault END')))
					   ->joinLeft('settings2users',
					   		  'settings.id = settings2users.settingId AND settings2users.settingUserId = ' . $userId,
					   		  array() )
					   ->where('settingName = ?', $settingName);
		$result = $db->fetchOne($select);

		return $result;
	}
	
	    /**
     * Получение определенного параметра для пользователя. Если параметр базе не определен,
     * то возвращается его дефолтовое значение. Если оно не установлено, то возвращается null
	 *
     * @param	int	$userId					Идентификатор пользователя
     * @param	string $settingName			Наименование определенного параметра
     * @param	string $settingValue		Новое значение параметра
     * @return	void
     */
	public function setUserSetting($userId, $settingName, $settingValue) {
		// Находим идентификатор параметра (и генерим исключение, если не находим)
		// TODO: Implement an exception
		$settingsTable = new Application_Model_DbTable_Settings();
		$settingId = $settingsTable->getIdByName($settingName);

		// Находим идентификатор строки с нужным параметром
		$settings2usersTable = new Application_Model_DbTable_Settings2Users();
		$rowId = $settings2usersTable->findByUserAndSetting($userId, $settingId);
		
		if ( $rowId === NULL) {
			// Add new record
			try {
				$settings2usersTable->addSettingValue($userId, $settingId, $settingValue);
			} catch (Zend_Exception $e) {
				// Если возникла ошибка, то надо перегенерить ее и отдать дальше
				throw new Zend_Exception ('Database error during adding new setting', -1, $e);
			}
		} else {
			// Update existing record
			try {
				$settings2usersTable->updateSettingValue($rowId, $settingValue);
			} catch (Zend_Exception $e) {
				// Если возникла ошибка, то надо перегенерить ее и отдать дальше
				throw new Zend_Exception ('Database error during modifying existing setting', -1, $e);
			}
		}
		return;
	}

}