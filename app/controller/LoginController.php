<?php


class LoginController extends Controller
{

    public function authorization()
    {
        if(!isset($_POST['email']) ||
            strlen(trim($_POST['email']))===0){
            $this->view->render('login',[
                '$message'=>'You have to enter email',
                'email'=>''
            ]);
            return;
        }

        if(!isset($_POST['password']) ||
            strlen(trim($_POST['password']))===0){
            $this->view->render('login',[
                'message'=>'You have to enter a password',
                'email'=>$_POST['email']
            ]);
            return;
        }


    }

}