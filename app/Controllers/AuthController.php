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
        $sysParams = new SystemParameterModel();

        $genderList = $sysParams->where('category', 'gender')->where('deleted_at', null)->findColumn('id');
        $maritalStatusList = $sysParams->where('category', 'marital_status')->where('deleted_at', null)->findColumn('id');
        $jobTitleList = $sysParams->where('category', 'job_title')->where('deleted_at', null)->findColumn('id');
        // $religionList = $sysParams->where('category', 'religion')->where('deleted_at', null)->findColumn('id');

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
                'rules'  => "permit_empty|".(is_array($maritalStatusList) ? "in_list[".implode(',', $maritalStatusList)."]" : ""),
                'errors' => [
                    'in_list' => 'Invalid marital status.',
                ]
            ],
            'gender' => [
                'rules'  => "permit_empty|".(is_array($genderList) ? "in_list[".implode(',', $genderList)."]" : ""),
                'errors' => [
                    'in_list' => 'Invalid gender.',
                ]
            ],
            'job_title' => [
                'rules'  => "permit_empty|".(is_array($jobTitleList) ? "in_list[".implode(',', $jobTitleList)."]" : ""),
                'errors' => [
                    'in_list' => 'Invalid job title.',
                ]
            ],
            // 'religion' => [
            //     'rules'  => "permit_empty|".(is_array($religionList) ? "in_list[".implode(',', $religionList)."]" : ""),
            //     'errors' => [
            //         'in_list' => 'Invalid religion.',
            //     ]
            // ],
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
            'marital_status' => empty($this->request->getVar('marital_status')) ? null : $this->request->getVar('marital_status'),
            'gender' => empty($this->request->getVar('gender')) ? null : $this->request->getVar('gender'),
            'job_title_id' => empty($this->request->getVar('job_title')) ? null : $this->request->getVar('job_title'),
            // 'religion' => $this->request->getVar('religion'),
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
