<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */

require "config/autoload.php";

$router = new Router();
$router->handleRequest($_GET);

