<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class ChannelManager extends AbstractManager
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @param Category $category
     * @return array
     */
    public function findByCategory(Category $category) : array
    {
        return [];
    }

    /**
     * @param Channel $channel
     * @return void
     */
    public function rename(Channel $channel) : void
    {

    }

    /**
     * @param Channel $channel
     * @return void
     */
    public function create(Channel $channel) : void
    {

    }

    /**
     * @param Channel $channel
     * @return void
     */
    public function delete(Channel $channel) : void
    {

    }
}