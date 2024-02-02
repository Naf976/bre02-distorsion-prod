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
        $query = $this->db->prepare('SELECT * FROM channels WHERE category_id=:category_id');
        $parameters = [
          "category_id" => $category->getId()
        ];
        $query->execute($parameters);
        $result = $query->fetchAll(PDO::FETCH_ASSOC);
        $channels = [];

        foreach($result as $item)
        {
            $channel = new Channel($item["name"], $category);
            $channel->setId($item["id"]);
            $channels[] = $channel;
        }

        return $channels;
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