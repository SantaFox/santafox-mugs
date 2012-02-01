<?php
/**
 * Starbucks Mugs
 *
 * @package		site
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Beta
 * @version		$Id: Log.php 160 2011-03-05 17:13:00Z santafox $
 */

/**
 * Модель для таблицы log
 *
 * Предназначена для записи в базу действий пользователей, связанных с изменение данных базы.
 * Указанная таблица не является логом ошибок, предупреждений или прочей служебной информации.
 *
 * @package		site
 * @subpackage	dbtables
 */
class Application_Model_DbTable_Log extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'log';
	protected $_primary = 'id';
	/**#@-*/

    /**
     * Запись информации в лог действий пользователей в базе
     *
     * Необходимый для модели параметр logUserId вычисляется из авторизации сессии
	 *
     * @throws	Zend_Exception			В случае ошибки базы данных
     * @param	string	$sAction		Действие (длина до 45 символов)
     * @param	string	$sDescription	Доп. информация (длина до 255 символов)
     * @return	int						Идентификатор новой записи
     */
	public function writeLog($sAction, $sDescription) {
		// Сначала надо получить пользователя
		$auth = Zend_Auth::getInstance();
		$userId = null; //$auth->getIdentity()->id;
		
		$params = array(
			'logUserId' => $userId,
			'logAction' => $sAction,
			'logDescription' => $sDescription
		);

		// Теперь делаем непосредственно операцию в базе
		try {
			$itemId = $this->insert( $params );
		} catch (Zend_Exception $e) {
			// Если возникла ошибка, то надо перегенерить ее и отдать дальше
			throw new Zend_Exception ('Ошибка базы данных', -1, $e);
		}
		
		return (int)$itemId;
	}

}
