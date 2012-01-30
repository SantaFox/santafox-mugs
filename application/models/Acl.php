<?php
/**
 * StarbucksMugs
 *
 * @package		site
 * @subpackage	models
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 * @version		$Id: Acl.php 169 2011-03-08 09:01:11Z santafox $
 */

/**
 * Модель для формирования ACL
 *
 * Потенциально позволяет читать ее из базы вместо построения в коде
 *
 * @package		site
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
			self::$_acl->addRole( new Zend_Acl_Role('user'), 'guest');
			self::$_acl->addRole (new Zend_Acl_Role('admin'), 'user');
 
			// Создаем основные рабочие ресурсы 
 			self::$_acl->addResource( new Zend_Acl_Resource('index') );
			self::$_acl->addResource( new Zend_Acl_Resource('users') );

			// Создаем служебные ресурсы для AJAX
			self::$_acl->addResource( new Zend_Acl_Resource('api') );
			
			// Создаем непонятные ресурсы (может потом разберусь, зачем они)
			self::$_acl->addResource( new Zend_Acl_Resource('error') );
			
			// Создаем админские ресурсы
			self::$_acl->addResource( new Zend_Acl_Resource('admin') );

			// Прописываем непосредственно правила доступа
			self::$_acl->deny();

			self::$_acl->allow(null, 'error', 'error');							// На эту страницу могут получить доступ все

			self::$_acl->allow('guest', 'index', 'index')						// Неавторизованные пользователи видят сайт
					   ->allow('guest', 'api',									// и ТЕОРЕТИЧЕСКИ имеют доступ к API
					   		   array('countries') )
					   ->allow('guest', 'admin', array('index','acquire', 'proxy', 'countries', 'series'));	// временно
					   		   
			self::$_acl->allow('guest', 'users', 'profile')						// профили пользователей
					   ->allow('guest', 'users',								// и регистрацию/логин
					   		   array('register', 'login') );

			self::$_acl->allow('user', 'users', 'logout')						// Авторизованные пользователи вылогиниваются
					   ->deny('user', 'users',									// и не могут заново зарегестрироваться
					   		   array('register', 'login') );
			
			self::$_acl->allow('admin', 'admin',								// Исключительно админские ресурсы
							   array('index') );
		}
 
		return self::$_acl;
	}
}
