<?php
/**
 * Модель для таблицы mugs
 *
 * Предназначена для работы со списком кружек, используемых в системе.
 *
 * @package		site
 * @subpackage	dbtables
 * @copyright	Copyright (c) 2012+ SantaFox
 * @since		1.0 Alpha
 */
class Application_Model_DbTable_Mugs extends Zend_Db_Table_Abstract {

	/**#@+
	 * Эти константы используются для связи с таблицей
	 * @ignore
	 */
	protected $_name = 'mugs';
	protected $_primary = 'id';
	/**#@-*/

    /**
     * Получение списка серий для облака
     *
     * Используется для получения списка серий с количество кружек, при
     * возможной фильтрации по пользователю и/или стране. Серии с количеством кружек = 0
     * не возвращаются.
     *
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>countryName</li>
     * <li>serieName</li>
     * <li>mugName</li>
     * </ul>
	 *
	 * @param	null|string	$userId		id пользователя для фильтрации
	 * @param	null|string	$countryId	id страны для фильтрации
	 * @return	Zend_Db_Rowset			Результат запроса
     */
	public function getMugsList($countryId = '', $serieId = '', $userId = '') {
		$select = $this->select()
		               ->setIntegrityCheck(false)      // Странная идея, надо доразобраться
					   ->from('mugs',
							  array('id',
									'mugName'))
					   ->join('countries',
					   		  'countries.id = mugs.mugCountryId',
					   		  array('countryName'))
					   ->join('series',
					   		  'series.id = mugs.mugSerieId',
					   		  array('serieName'))
    				   ->order(array('countryName', 'serieName', 'mugName'));
        
        if ($userId != '') {
			$select->joinLeft('mugs2users',
					  		  'mugs.id = mugs2users.mugId AND mugs2users.mugUserId = ' . $userId,
					  array('mugUserStatus' => 'mugStatus') );
        }

        if ($countryId != '') {
            $select->where('mugCountryId = ?', (int)$countryId);
        }

        if ($serieId != '') {
            $select->where('mugSerieId = ?', (int)$serieId);
        }

    	return $this->fetchAll($select);
	}

    /**
     * Получение списка всех зарегестрированных в системе кружек с указанием страны и серии
     *
     * Возвращаются только необходимые поля:
     * <ul>
     * <li>id</li>
     * <li>mugName</li>
     * <li>mugCountryId</li>
     * <li>mugSerieId</li>
     * </ul>
	 *
     * @return	Zend_Db_Rowset			Результат запроса
     */
	public function getMugsForAcquire() {
		$select = $this->select()
					   ->from('mugs',
							  array('id',
									'mugName',
									'mugCountryId',
									'mugSerieId'));

    	return $this->fetchAll($select);
	}

    /**
     * Создание новой кружки
     *
     * Должны быть заполнены необходимые поля записи:
     * <ul>
	 * <li>mugName</li>
	 * <li>mugCountryId</li>
	 * <li>mugSerieId</li>
	 * </ul>
     *
     * @throws	Zend_Exception			В случае ошибки базы данных
     * @param	array	$params			Данные для новой записи в формате "Имя поля" => "Новое значение"
     * @return	int						Идентификатор новой записи
     */
	public function addMug ($params) {
		// Теперь делаем непосредственно операцию в базе
		try {
			$mugId = $this->insert( $params );
		} catch (Zend_Exception $e) {
			// Если возникла ошибка, то надо перегенерить ее и отдать дальше
			throw new Zend_Exception ('Ошибка базы данных', -1, $e);
		}
		
		return $mugId;
	}
}
