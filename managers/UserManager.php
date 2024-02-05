<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class UserManager extends AbstractManager
{
    public function findOne(int $id) : User
    {
        $query = $this->db->prepare('SELECT * FROM users WHERE id=:id');
        $parameters = [
            "id" => $id
        ];
        $query->execute($parameters);
        $result = $query->fetch(PDO::FETCH_ASSOC);

        $user = new User($result["username"], $result["password"], $result["role"]);
        $user->setId($result["id"]);

        return $user;
    }

    public function findByUsername(string $username) : ? User
    {
        $query = $this->db->prepare('SELECT * FROM users WHERE username=:username');
        $parameters = [
            "username" => $username
        ];
        $query->execute($parameters);
        $result = $query->fetch(PDO::FETCH_ASSOC);

        if($result)
        {
            $user = new User($result["username"], $result["password"], $result["role"]);
            $user->setId($result["id"]);

            return $user;
        }

        return null;
    }
}