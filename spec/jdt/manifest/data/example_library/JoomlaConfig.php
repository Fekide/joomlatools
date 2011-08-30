<?php

namespace ActiveRecord;

class JoomlaConfig extends Config
{

    private $model_directories = array();

    public function set_model_directory($dir)
    {
        parent::set_model_directory($dir);

        // add model path to array of model paths
        array_push($this->model_directories, $dir);
    }


    public function get_model_directories()
    {
        return $this->model_directories;
    }

    public function set_joomla_connection($connection_type = "production")
    {
        // get config from Joomla
        $config = new JConfig();

        // extract values from Joomla
        $username = $config->user;
        $password = $config->password;
        $host = $config->host;
        $database = $config->db;

        // compute connection string for ActiveRecord
        $connection = "mysql://$username:$password@$host/$database";

        // set connection string
        $this->set_connections(array($connection_type => $connection));
    }

}