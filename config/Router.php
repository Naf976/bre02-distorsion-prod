<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class Router
{
    public function __construct()
    {

    }

    public function handleRequest(array $get)
    {
        if(isset($get["route"]) && $get["route"] === "chat")
        {
            $controller = new ChatController();

            if(isset($get["channel"]))
            {
                $controller->channel($get["channel"]);
            }
            else
            {
                $controller->chat();
            }
        }
        else if(!isset($get["route"]))
        {
            $controller = new ChatController();
            $controller->chat();
        }
        else if(isset($get["route"]) && ($get["route"] === "create-category"))
        {
            $controller = new ChatController();
            $controller->createCategory();
        }
        else if(isset($get["route"]) && ($get["route"] === "create-channel"))
        {
            $controller = new ChatController();
            $controller->createChannel();
        }
        else if(isset($get["route"]) && ($get["route"] === "send-message"))
        {
            $controller = new ChatController();
            $controller->sendMessage();
        }
    }
}