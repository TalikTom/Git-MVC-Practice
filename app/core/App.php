<?php

/*This code defines a class App which contains a single static method start().
The purpose of the start() method is to handle incoming requests and determine
the appropriate controller and method to handle the request. */

class App
{

    public static function start()
    {
        /*
         * The $route variable is set to the result of calling the getRoute() method of the Request class.
         * This retrieves the requested URL from the request object.
         */
        $route = Request::getRoute();

        /*
         * The $parts variable is set to an array of substrings obtained by splitting the $route string by the forward-slash character.
         * The substr() function is used to remove the leading forward-slash character from the string before splitting it.
         */
        $parts = explode('/',substr($route,1));

        /*
         * The $controller variable is set based on the first substring obtained from the request URL.
         * If the first substring is empty or not set, the default controller name 'IndexController' is used.
         * Otherwise, the first substring is capitalized and appended with 'Controller' to form the name of the controller class to be used.
         */

        if(!isset($parts[0]) || $parts[0]===''){
            $controller='IndexController';
        }else{
            $controller = ucfirst($parts[0]) . 'Controller';
        }

        /*
         * The $method variable is set based on the second substring obtained from the request URL.
         * If the second substring is empty or not set, the default method name 'index' is used.
         * Otherwise, the second substring is used as the name of the method to be called.
         */

        if(!isset($parts[1]) || $parts[1]==='' ){
            $method='index';
        }else{
            $method=$parts[1];
        }

        /*
         * This code block checks if the controller class and method exist. If either does not exist, an error message is printed and the method returns.
         */

        if(!(class_exists($controller) && method_exists($controller,$method))){
            echo 'Doesn\'t exist ' . $controller . '-&gt;' . $method;
            return;
        }

        /*
         * An instance of the controller class is created and the appropriate method is called to handle the request.
         */
        $instance = new $controller();
        $instance->$method();
    }

    public static function auth()
    {
        return isset($_SESSION['auth']);
    }

}