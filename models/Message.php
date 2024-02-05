<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class Message
{
    private ? int $id = null;

    /**
     * @param string $content
     * @param Channel $channel
     * @param User $user
     * @param DateTime $createdAt
     */
    public function __construct(private string $content, private Channel $channel, private User $user, private DateTime $createdAt)
    {

    }

    /**
     * @return int|null
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @param int|null $id
     */
    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    /**
     * @return string
     */
    public function getContent(): string
    {
        return $this->content;
    }

    /**
     * @param string $content
     */
    public function setContent(string $content): void
    {
        $this->content = $content;
    }

    /**
     * @return Channel
     */
    public function getChannel(): Channel
    {
        return $this->channel;
    }

    /**
     * @param Channel $channel
     */
    public function setChannel(Channel $channel): void
    {
        $this->channel = $channel;
    }

    /**
     * @return User
     */
    public function getUser(): User
    {
        return $this->user;
    }

    /**
     * @param User $user
     */
    public function setUser(User $user): void
    {
        $this->user = $user;
    }

    /**
     * @return DateTime
     */
    public function getCreatedAt(): DateTime
    {
        return $this->createdAt;
    }

    /**
     * @param DateTime $createdAt
     */
    public function setCreatedAt(DateTime $createdAt): void
    {
        $this->createdAt = $createdAt;
    }

    public function toArray()
    {
        return [
            "content" => $this->content,
            "channel" => $this->getChannel()->getId(),
            "user" => $this->getUser()->getUsername(),
            "created_at" => $this->createdAt->format("d/m/y H:i")
        ];
    }
}