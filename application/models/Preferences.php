<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	models
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Release
 * @version		$Id$
 */

/**
 * Модель для работы с настройками пользователя
 *
 * Данная модель является более высоким уровнем для соответствующей модели по работа с соответствующими таблицами базы данных.
 * Моделями базы данных не рекомендуется пользоваться без серьезной причины.
 *
 * @package		dashboard
 * @subpackage	models
 */
class Application_Model_Preferences {

    /**
     * Переменная для хранения статической переменной с созданным ACL
	 *
     * @var null|Zend_Acl
     */
	protected static $_acl = null;
}