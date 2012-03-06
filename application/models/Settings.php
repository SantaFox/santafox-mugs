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
		// Находим нужную запись и обрабатываем исключение
		$settingsTable = new Application_Model_DbTable_Settings();
		$settingId = $settingsTable->getIdByName($settingName);

		$settings2usersTable = new Application_Model_DbTable_Settings2Users();
		$rows = $settings2usersTable->findByUserAndSetting($userId, $settingId);
		if (count($rows) == 0) {
			throw new Zend_Exception ("Запись с userId = {$userId} и settingName = {$settingName} не найдена");
		};
		$row = $rows->current();

$row->settingValue = $settingValue;
$row->save();
//
		// Зачем-то обрабатываем ситуацию, когда передан пустой $params
//		$iChanged = count($params);
//		if ( $iChanged == 0 ) {
//			return 0;
//		}
//		
		// Теперь делаем непосредственно операцию в базе
//		try {
//			$row->setFromArray($params);
//			$row->save();
//		} catch (Zend_Exception $e) {
			// Если возникла ошибка, то надо перегенерить ее и отдать дальше
//			throw new Zend_Exception ('Ошибка базы данных', -1, $e);
//		}
//		return;
	}

}