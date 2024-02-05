<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class ChatController extends AbstractController
{
    private CategoryManager $catM;
    private ChannelManager $chanM;
    private MessageManager $mm;

    public function __construct()
    {
        $this->chanM = new ChannelManager();
        $this->catM = new CategoryManager();
        $this->mm = new MessageManager();
    }

    public function chat() : void
    {
        $categories = $this->catM->findAll();
        $list = [];

        foreach($categories as $category)
        {
            $item = [];
            $item["category"] = $category;
            $item["channels"] = $this->chanM->findByCategory($category);
            $list[] = $item;
        }

        $this->render("chat", [
            "categories" => $list
        ]);
    }

    public function channel(string $channelId) : void
    {

    }

    public function createCategory() : void
    {
        $this->renderJson(["status" => "OK", "category" => []]);
    }

    public function createChannel() : void
    {
        $this->renderJson(["status" => "OK", "channel" => []]);
    }
}