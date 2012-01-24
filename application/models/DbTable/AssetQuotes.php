<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Alpha
 * @version		$Id: AssetQuotes.php 160 2011-03-05 17:13:00Z santafox $
 */

/**
 * Модель для таблицы dashboard.assetQuotes
 *
 * Предназначена для работы со списком текущих котировок.
 *
 * @package		dashboard
 * @subpackage	dbtables
 */
class Application_Model_DbTable_AssetQuotes extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'assetQuotes';
	protected $_primary = 'id';
	/**#@-*/

    /**
     * Возвращение развернутого списока партий
     *
     * Фильтрация по подстроке выполняется в:
     * <ul>
     * <li>наименовании ценной бумаги</li>
     * <li>источнике котировок</li>
     * </ul>
     * Используется контроллером {@link QuotesController::dataAction()} для формирования AJAX ответа с данными для таблицы
     *
     * @param	string	$sSearch		Подстрока для поиска
     * @return	Zend_Db_Rowset			Результат запроса
     */
    public function getQuotes ($