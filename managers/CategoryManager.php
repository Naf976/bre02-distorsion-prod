<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class CategoryManager extends AbstractManager
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @return array
     */
    public function findAll() : array
    {
        return [];
    }

    /**
     * @param string $name
     * @return Category|null
     */
    public function findOneByName(string $name) : ? Category
    {
        return null;
    }

    /**
     * @param Category $category
     * @return void
     */
    public function rename(Category $category) : void
    {

    }

    /**
     * @param Category $category
     * @return void
     */
    public function delete(Category $category) : void
    {

    }
}