<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\UserModel;
use CodeIgniter\HTTP\ResponseInterface;

class AdminController extends BaseController
{
    public function index()
    {
        if (!session()->has('user_id')) {
            return redirect()->to(base_url('/auth/login'));
        }

        $user = new UserModel();
        $admin = $user->find(session()->get('user_id'));
        // count of users created today
        date_default_timezone_set('Asia/Manila');
        $today = date('Y-m-d');
        $newUsers = $user->where("DATE(created_at) = ", $today)->countAllResults();
        $allUser = $user->countAllResults();
        $deletedUsers = $user->where('deleted_at IS NOT NULL')->countAllResults();
        $activeUsers = $user->where('status = ', 'active')->countAllResults();

        $chartData = $user->select('COUNT(user.id) as count, role_name')
            ->groupBy('user_role_id')
            ->join('user_role', 'user_role.id = user.user_role_id')
            ->findAll();

        $allUsers = $user->select('firstname, lastname, email_address, created_at')
            ->where('id !=', session()->get('user_id'))
            ->where('deleted_at IS NULL')
            ->findAll();

        $count = [
            'newUsers' => $newUsers,
            'allUsers' => $allUser,
            'deletedUsers' => $deletedUsers,
            'activeUsers' => $activeUsers,
        ];
        
        $data = [
            'admin' => $admin,
            'page_title' => 'Dashboard',
            'count' => $count,
            'allUsers' => $allUsers,
            'chartData' => $chartData,
        ];

        return view('admin/index', $data);
    }


}
