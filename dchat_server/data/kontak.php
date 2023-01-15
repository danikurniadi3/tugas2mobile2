<?php
class kontak
{
    public $id;
    public $name;
    public $telepon;

    private $conn;
    private $table = "kontak";

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    function add()
    {
        $query = "INSERT INTO
                " . $this->table . "
            SET
               id=:id, name=:name, telepon=:telepon";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('name', $this->name);
        $stmt->bindParam('telepon', $this->telepon);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function delete()
    {
        $query = "DELETE FROM " . $this->table . " WHERE id = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function fetch()
    {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function get()
    {
        $query = "SELECT * FROM " . $this->table . " p          
                WHERE
                    p.id = ?
                LIMIT
                0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);

        $stmt->execute();

        $product = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->id = $kontak['id'];
        $this->name = $kontak['name'];
        $this->telepon = $kontak['telepon'];
    }

    function update()
    {
        $query = "UPDATE
                " . $this->table . "
            SET
                name = :name,
                telepon = :telepon
            WHERE
                id = :id";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('name', $this->name);
        $stmt->bindParam('telepon', $this->telepon);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
}
