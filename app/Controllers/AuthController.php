<?php

namespace App\Controllers;

use App\Models\RoleModel;
use App\Models\SystemParameterModel;
use App\Models\UserModel;
use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class AuthController extends BaseController
{
    public function __construct()
    {
        helper(['form', 'url']);
    }

    public function login()
    {
        if (session()->has('user_id')) {
            return redirect()->to(base_url('admin/dashboard'));
        }
        return view('auth/login', ['page_title' => 'Login']);
    }

    public function logout()
    {
        session()->destroy();
        return redirect('auth/login');
    }

    public function doLogin()
    {
        $rules = [
            'email' => [
                'rules'  => 'required|valid_email',
                'errors' => [
                    'required' => 'Email is required.',
                    'valid_email' => 'Please enter a valid email address.'
                ]
            ],
            'password' => [
                'rules'  => 'required',
                'errors' => [
                    'required' => 'Password is required.'
                ]
            ]
        ];

        if (!$this->validate($rules)) {
            $errors = $this->validator->getErrors();

            $notif = [
                'status' => 'error',
                'message' =>  implode('<br>', $errors)
            ];

            session()->setFlashdata('notif', $notif);
            return redirect()->back()->withInput();
        }

        // continue with login process
        $email = $this->request->getVar('email');
        $password = $this->request->getVar('password');

        $user = new UserModel();
        $account = $user->where('email_address', $email)->first();

        if (!$account) {
            $notif = [
                'status' => 'error',
                'message' => 'No account found with that email.'
            ];
            session()->setFlashdata('notif', $notif);
            return redirect()->back()->withInput();
        }

        if (!password_verify($password, $account['password'])) {
            $notif = [
                'status' => 'error',
                'message' => 'Incorrect password.'
            ];
            session()->setFlashdata('notif', $notif);
            return redirect()->back()->withInput();
        }

        // set session
        session()->set([
            'user_id' => $account['id']
        ]);
        return redirect('/');
    }

    public function register()
    {
        if (session()->has('user_id')) {
            return redirect()->to(base_url('admin/dashboard'));
        }

        $sysParams = new SystemParameterModel();
        // $parameters = $sysParams->findAll();
        $parameters = $sysParams->where('deleted_at', null)->findAll();


        $data = [
            'page_title' => 'Register',
            'parameters' => $parameters,
        ];

        return view('auth/register', $data);
    }

    public function doRegister()
    {
        $rules = [
            'firstname' => [
                'rules'  => 'required',
                'errors' => [
                    'required' => 'First name is required.'
                ]
            ],
            'lastname' => [
                'rules'  => 'required',
                'errors' => [
                    'required' => 'Last name is required.'
                ]
            ],
            'marital_status' => [
                // 'rules'  => 'greater_than[0]',
                'errors' => [
                    'greater_than' => 'Marital status is required.',
                ]
            ],
            'job_title' => [
                // 'rules'  => 'greater_than[0]',
                'errors' => [
                    'greater_than' => 'Job title is required.',
                ]
            ],
            'gender' => [
                // 'rules'  => 'greater_than[0]',
                'errors' => [
                    'greater_than' => 'Gender is required.',
                ]
            ],
            'religion' => [
                // 'rules'  => 'greater_than[0]',
                'errors' => [
                    'greater_than' => 'Religion is required.',
                ]
            ],
            'email' => [
                'rules'  => 'required|valid_email|is_unique[user.email_address]',
                'errors' => [
                    'required' => 'Email is required.',
                    'valid_email' => 'Please enter a valid email address.',
                    'is_unique' => 'Email address already exists.'
                ]
            ],
            'password' => [
                'rules'  => 'required|min_length[8]',
                'errors' => [
                    'required' => 'Password is required.',
                    'min_length' => 'Password must be at least 8 characters long.'
                ]
            ],
        ];

        if (!$this->validate($rules)) {
            $errors = $this->validator->getErrors();
            $notif = [
                'status' => 'error',
                'message' =>  implode('<br>', $errors)
            ];
            session()->setFlashdata('notif', $notif);
            return redirect()->back()->withInput();
        }

        // continue with registration process
        date_default_timezone_set('Asia/Manila');
        $user = new UserModel();
        $user->save([
            'firstname' => $this->request->getVar('firstname'),
            'lastname' => $this->request->getVar('lastname'),
            'email_address' => $this->request->getVar('email'),
            'password' => password_hash($this->request->getVar('password'), PASSWORD_DEFAULT),
            'created_at' => date('Y-m-d H:i:s'),
            'updated_at' => date('Y-m-d H:i:s'),
        ]);

        $notif = [
            'status' => 'success',
            'message' => 'Account created successfully. You can now login.'
        ];

        session()->setFlashdata('notif', $notif);
        return redirect()->to(base_url('auth/login'));
    }
}
