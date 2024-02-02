<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class MessageManager extends AbstractManager
{
    public function __construct()
    {
        parent::__construct();
    }

    public function findByChannel(Channel $channel) : array
    {
        return [];
    }

    public function delete(Message $message) : void
    {

    }
}