<?php

class Operater
{


    public static function read()
    {
        $connection = DB::getInstance();
        $statement = $connection->prepare('
        
            select * from operator
        ');
        $connection->execute();
        return $connection->fetchAll();
    }


    public static function authorize($email,$password)
    {
        $connection = DB::getInstance();
        $statement = $connection->prepare('
        
            select * from operator where email=:email
        ');
        $connection->execute([
            'email'=>$email
        ]);

        $operator = $statement->fetch();

        if($operator==null){
            return null;
        }

        if(!password_verify($password,$operator->password)){
            return null;
        }

        unset($operator->password);

        return $operator;
    }
}