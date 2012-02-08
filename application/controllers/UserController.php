<?php
/**
 * StarbucksMugs
 *
 * @package		site
 * @subpackage	controllers
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 * @version		$Id: LoginController.php 152 2011-03-05 10:51:01Z santafox $
 */

/**
 * Контроллер для обработки действий по авторизации
 *
 * @package		site
 * @subpackage	controllers
 */
class UserController extends Zend_Controller_Action {

    /**
     * Переменная для хранения ссылки на текущую авторизацию
	 *
	 * Если в переменной NULL, то авторизация не произведена
	 *
     * @var null|Zend_Auth
     */
	public $_auth;

    /**
     * Инициализация контроллера
     *
     * Записывает идентификатор авторизации в переменную {@link $_auth}
	 * и дублирует ее в представление для вывода информации о пользователе.
     */
	public function init() {
		$this->_auth = Zend_Auth::getInstance();
		$this->view->auth = $this->_auth;
	}
	
    /**
     * Действие контроллера - стандартный обработчик /index
     *
     * Выполняет непосредственно авторизацию.<br />
     * Если вызов делается методом GET (то есть обычным заходом на страницу, то рендерится форма запроса.<br />
     * Если происходит вызов POST, то сначала форма проверяется на заполненность (если что-то не так - то запрашивается снова),
     * после чего создается <b>Zend_Auth_Adapter_DbTable</b>.<br />
     * При удачной авторизации сохраняются три поля из базы:
     * <ul>
     * <li>id</li>
     * <li>userName</li>
     * <li>userRole</li>
     * </ul>
     *
     * @uses	getAuthAdapter()
     * @uses	getLoginForm()
     */
	public function indexAction() {
		$log = Zend_Registry::get('log');
		
		if (!$this->getRequest()->isPost()) {
			$this->view->form = $this->getLoginForm();
			 $this->render('login');
		}
		else {
			$form = $this->getLoginForm();
			
			 if (!$form->isValid($_POST)) {
			 	$this->view->form = $form;
				 return $this->render('login');
			 }
			 $values = $form->getValues();
			 $authAdapter = $this->getAuthAdapter();
			 
			 $authAdapter->setIdentity($values['username'])
			 			->setCredential($values['password']);
			 			
				$authResult = $this->_auth->authenticate($authAdapter);
				
				if ( $authResult->isValid() ) {
					$storage = $this->_auth->getStorage();
					$storage->write($authAdapter->getResultRowObject(array(
					'id', 'userName', 'userRole')));
					
					$log->info('Удачная авторизация пользователя ' . $this->_auth->getIdentity()->userName);
				
					$this->_redirect("/items");
				}
				else {
					$this->view->form = $form;
					$this->view->authError = true;
				 return $this->render('login');
				}
		}
	}
	
    /**
     * Возвращает специальный адаптер для авторизации по записям в таблице
     *
     * Никакие схемы шифрования на данный момент не используются.
     *
     * @return	Zend_Auth_Adapter_DbTable
     */
	public function getAuthAdapter() {
		$db = Zend_Db_Table_Abstract::getDefaultAdapter();
		
		$authAdapter = new Zend_Auth_Adapter_DbTable(
			  $db,
			  'users',
			  'userLogin',
			  'userPassword'
		);
		
		//$authAdapter->setCredentialTreatment("SHA1(CONCAT(userSalt, '-', ?))");
		//$authAdapter->setCredentialTreatment("SHA1(?)");
		
		return $authAdapter;
	}

    /**
     * Действие контроллера - стандартный обработчик /logout
     *
     * Обнуляет авторизацию и вызывает стартовую страницу через {@link IndexController::indexAction()}.
     */
	public function logoutAction() {
		Zend_Auth::getInstance()->clearIdentity();
		$this->_redirect("/");
	}
}