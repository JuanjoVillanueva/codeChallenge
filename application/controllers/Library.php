<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Library extends CI_Controller {

    function __construct(){
		parent::__construct();
		$this->load->library('grocery_CRUD');
        $this->load->library('session');
    }

	public function index()
	{   
        /* $cont = array(
            'TITULO' => 'Home'
        );

        $data = array(
			'DIR'=>base_url(),
			'CONTENT'=>$this->parser->parse('home.html',$cont,true),
		);
		$this->parser->parse('template.html',$data); */
        $this->book();
	}

    public function book(){
        $this->grocery_crud->set_table('book')
		->set_subject('book')
		->columns('name','author','published_date','id_user')
        ->set_relation_n_n('categories', 'book_category', 'category', 'id_book', 'id_cat', 'name','priority')
		->required_fields('name','author','published_date','categories')
		->set_relation('id_user','user','name')
        ->display_as('id_user','User')
        ->set_rules('author', 'Author', 'trim|required|alpha')
        ->unset_print()
        ->unset_clone()
        ->callback_after_update(array($this, '_availability'))
		;

        $msg='';
        if($this->session->flashdata('book')){
            $msg='
            <div class="alert alert-info alert-available alert-dismissible" style="display:none" role="alert">
                The book: <b>'.$this->session->flashdata('book').'</b>. Is now available. "Message sent"
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <script type="text/javascript">
            $(document).ready(function() {
                $(".alert-available").slideDown("slow").delay(10000).slideUp("slow");
            });
            </script>';
        }

        $output = $this->grocery_crud->render();
        $data = array(
			'DIR'=>base_url(),
			'ACT1'=>'active',
			'AVIABILITY'=>$msg,
			'CONTENT'=>$this->parser->parse('crud',(array)$output,true),
		);
		$this->parser->parse('template.html',$data);
        
    }

    function _availability($post_array,$primary_key)
    {
        if($post_array['id_user']==null){
            $this->session->set_flashdata('book', $post_array['name']);
        }
        return true;
    }

    public function category(){
        $this->grocery_crud->set_table('category')
		->set_subject('category')
		->columns('name')
		->required_fields('name','description')
        ->unset_print()
        ->unset_clone()
        ->set_rules('name', 'Name', 'trim|required|alpha')
		;

        $output = $this->grocery_crud->render();
        $data = array(
			'DIR'=>base_url(),
			'ACT2'=>'active',
			'AVIABILITY'=>'',
			'CONTENT'=>$this->parser->parse('crud',(array)$output,true),
		);
		$this->parser->parse('template.html',$data);
        
    }
    public function user(){
        $this->grocery_crud->set_table('user')
		->set_subject('user')
		->columns('name','email')
		->required_fields('name','email')
        ->unset_print()
        ->unset_clone()
        ->set_rules('name', 'Name', 'trim|required|alpha')
        ->set_rules('email', 'Email', 'trim|required|valid_email')
		;

        $output = $this->grocery_crud->render();
        $data = array(
			'DIR'=>base_url(),
			'ACT3'=>'active',
			'AVIABILITY'=>'',
			'CONTENT'=>$this->parser->parse('crud',(array)$output,true),
		);
		$this->parser->parse('template.html',$data);
        
    }
}
