<?php


class OperatorController extends AdminController
{
    private $viewPutanja = 'private' .
    DIRECTORY_SEPARATOR . 'operators' .
    DIRECTORY_SEPARATOR;

    public function index()
    {

        $operators = Operater::read();
        foreach($operators as $o){
            unset($o->password);
        }


        $this->view->render($this->viewPutanja . 'index',[
            'data'=>$operators
        ]);
    }

}