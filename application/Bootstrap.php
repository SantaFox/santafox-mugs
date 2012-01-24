<?php
/**
 * PEKO-M Dashboard
 *
 * @package		dashboard
 * @subpackage	core
 * @copyright	Copyright (c) 2011+ PEKO-M
 * @since		1.0 Alpha
 * @version		$Id: Bootstrap.php 152 2011-03-05 10:51:01Z santafox $
 */

/**
 * Контроллер для операций с партиями
 *
 * @package		dashboard
 * @subpackage	core
 */
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    /**
     * Инициализация автолоадера классов
	 *
	 * @return	Zend_Application_Module_Autoloader
     */
	protected function _initDefaultModuleAutoloader() {
		$loader = new Zend_Application_Module_Autoloader(array(
					'namespace' => 'Application',
					'basePath' => APPLICATION_PATH
				));
		return $loader;		
	}
	
    /**
     * Инициализация ведения служебного лога
     *
     * Создает объект <b>Zend_Log</b>, направляет его вывод в текстовый файл с путем "/../temp/app.log"
     * через экземпляр <b>Zend_Log_Writer_Stream</b>. Если установлен режим эксплуатации <b>PRODUCTION</b>,
     * то к логу добавляется фильтр уровня <b>Zend_Log::CRIT</b>.
     * Полученный объект записывается в Zend_Registry с именем <b>"log"</b>.
     */
    protected function _initLogging() {
        $this->bootstrap('frontController');

/*        $writer = 'production' == $this->getEnvironment() ?
                 new Zend_Log_Writer_Stream(APPLICATION_PATH . '/../data/logs/app.log') :
                 new Zend_Log_Writer_Firebug();
*/
        $writer = new Zend_Log_Writer_Stream(APPLICATION_PATH . '/../temp/app.log');

        $logger = new Zend_Log();
        $logger->addWriter($writer);
    
        if ('production' == $this->getEnvironment()) {
               $filter = new Zend_Log_Filter_Priority(Zend_Log::CRIT);
               $logger->addFilter($filter);
        }

        $this->_logger = $logger;
        Zend_Registry::set('log', $logger);
     }

}
