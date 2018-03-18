<?php

class Author implements JsonSerializable
{
    private $id, $name, $surname, $description, $books;

    public static $db;

    public function __construct(PDO $db)
    {
        self::$db = $db;

        $this->id = -1;
        $this->name = '';
        $this->surname = '';
        $this->description = '';
    }

    public function save()
    {
        if ($this->id > 0) {
            //update
            $sql = "UPDATE authors SET name=:name, surname=:surname, description=:description WHERE id=:id";
            $stmt = self::$db->prepare($sql);
            $stmt->execute(
                [
                    'id' => $this->id,
                    'name' => $this->name,
                    'surname' => $this->surname,
                    'description' => $this->description
                ]
            );

            return $this;
        } else {
            //insert
            $sql = "INSERT INTO authors SET name=:name, surname=:surname, description=:description";
            $stmt = self::$db->prepare($sql);
            $stmt->execute(
                [
                    'name' => $this->name,
                    'surname' => $this->surname,
                    'description' => $this->description,
                ]
            );

            $this->id = self::$db->lastInsertId();

            return $this;
        }
    }

    public function delete()
    {
        $sql = "DELETE FROM authors WHERE id=:id";
        $stmt = self::$db->prepare($sql);
        $stmt->execute(
            [
                'id' => $this->id,
            ]
        );

        return $stmt->rowCount() > 0;
    }

    /**
     * Load all authors or one author if id provided
     *
     * @param PDO $db
     * @param null $id
     *
     * @return array
     */
    public static function loadAll(PDO $db, $id = null)
    {
        $params = [];
        if (!$id) {
            $sql = "SELECT * FROM authors";
        } else {
            $sql = "SELECT * FROM authors WHERE id=:id";
            $params = ['id' => $id];
        }
        $stmt = $db->prepare($sql);
        $stmt->execute($params);

        $authors = $stmt->fetchAll(PDO::FETCH_OBJ);
        $authorsList = [];

        //load Book class
        if (!class_exists('Book')) {
            include_once __DIR__ . '/Book.php';
        }

        foreach ($authors as $dbAuthor) {
            $author = new Author($db);
            $author->id = $dbAuthor->id;
            $author->name = $dbAuthor->name;
            $author->surname = $dbAuthor->surname;
            $author->description = $dbAuthor->description;
            $author->books = [];

            $books = Book::loadAllByAuthor($db, $dbAuthor->id);
            foreach ($books as $book) {
                $author->books[] = json_decode(json_encode($book), true);
            }

            $authorsList[] = $author;
        }

        return $authorsList;
    }

    public function jsonSerialize()
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'surname' => $this->surname,
            'description' => $this->description,
            'books' => $this->books,
        ];
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param string $name
     *
     * @return $this
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return string
     */
    public function getSurname()
    {
        return $this->surname;
    }

    /**
     * @param string $surname
     *
     * @return $this
     */
    public function setSurname($surname)
    {
        $this->surname = $surname;

        return $this;

    }

    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param mixed $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

}