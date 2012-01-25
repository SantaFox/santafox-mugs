<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	models
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Beta
 * @version		$Id: Acl.php 169 2011-03-08 09:01:11Z santafox $
 */

/**
 * Модель для формирования ACL
 *
 * Потенциально позволяет читать ее из базы вместо построения в коде
 *
 * @package		dashboard
 * @subpackage	models
 */
class Application_Model_Acl {

    /**
     * Переменная для хранения статической переменной с созданным ACL
	 *
     * @var null|Zend_Acl
     */
	protected static $_acl = null;
 
    /**
     * Возвращает (и создает, если нужно) объект с правами по приложению
	 * @todo	Доделать тему с клиентами - редактирует админ, но рабочие запросы могут делать все
     *
	 * @return	Zend_Acl
     */
	public static function getAcl() {
		if ( null === self::$_acl ) {
			self::$_acl = new Zend_Acl();
 
			// Создаем роли
			self::$_acl->addRole( new Zend_Acl_Role('guest') );					// Используется для неавторизованных пользователей
			self::$_acl->addRole( new Zend_Acl_Role('viewer') );
			self::$_acl->addRole (new Zend_Acl_Role('admin'), 'viewer');
 
			// Создаем общедоступные ресурсы
			self::$_acl->addResource( new Zend_Acl_Resource('login') );

			// Создаем основные рабочие ресурсы 
			self::$_acl->addResource( new Zend_Acl_Resource('items') );
			self::$_acl->addResource( new Zend_Acl_Resource('assets') );
			self::$_acl->addResource( new Zend_Acl_Resource('quotes') );

			// Создаем служебные ресурсы для AJAX
			self::$_acl->addResource( new Zend_Acl_Resource('clients') );
			
			// Создаем непонятные ресурсы (может потом разберусь зачем они
 			self::$_acl->addResource( new Zend_Acl_Resource('index') );
			self::$_acl->addResource( new Zend_Acl_Resource('error') );

			// Прописываем непосредственно правила доступа
			self::$_acl->deny();

			self::$_acl->allow(null, 'error', 'error');							// На эту страницу могут получить доступ все

			self::$_acl->allow('guest', 'login', 'index');						// Неавторизованный пользователь может только влогиниваться

			self::$_acl->allow('viewer',
							   array('items', 'assets', 'quotes'),
							   array('index', 'data'))
					   ->allow('viewer', 'clients', 'list')
					   ->allow('viewer', 'login', 'logout');
			
			self::$_acl->allow('trader', 'items',
							   array('add', 'update', 'delete', 'sell'));
		}
 
		return self::$_acl;
	}
}
