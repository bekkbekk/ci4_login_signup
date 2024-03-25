<?php

namespace App\Models;

use CodeIgniter\Model;

class UserModel extends Model
{
    protected $table            = 'user';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = true;
    protected $protectFields    = true;
    protected $allowedFields    = ['firstname', 'lastname', 'user_role_id', 'email_address', 'password', 'gender', 'marital_status', 'dob', 'mobile_number', 'phone_number', 'address', 'slug_id', 'photo', 'status', 'created_by', 'created_at', 'updated_at', 'deleted_at'];
}
