<?php

  class DatabaseConfig{
    // Valitse käyttämäsi tietokantapalvelin - PostgreSQL (psql) tai MySQL (mysql)
    private static $use_database = 'mysql';

    // Muuta users-ympäristöä asettamalle oikeat arvot KAYTTAJATUNNUS-kohtaan (käyttäjätunnuksesi)
    // ja SALASANA-kohtaan (tietokantasi pääkäyttäjän salasana)
    private static $connection_config = array(
      'psql' => array(
        'resource' => 'pgsql:'
      ),
      'mysql' => array(
      'user' => 'bc010aef102bb6',
      'pass' => '72fb1428',
      'host' => 'us-cdbr-iron-east-05.cleardb.net',
     )
    );

    public static function connection_config(){
      $config = array(
        'db' => self::$use_database,
        'config' => self::$connection_config[self::$use_database]
      );

      return $config;
    }

  }
