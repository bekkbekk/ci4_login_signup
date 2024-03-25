<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */

//  Landing Page
$routes->get('/', 'AdminController::index');

// Auth Routes
$routes->group('auth', function ($routes) {
    $routes->get('login', 'AuthController::login');
    $routes->get('logout', 'AuthController::logout');
    $routes->get('register', 'AuthController::register');

    // posts
    $routes->post('do-login', 'AuthController::doLogin');
    $routes->post('do-register', 'AuthController::doRegister');
});

// Admin Routes
$routes->group('admin', function ($routes) {
    $routes->get('dashboard', 'AdminController::index');
    // $routes->get('users', 'Admin\Users::index');
    // $routes->get('users/(:num)', 'Admin\Users::show/$1');
    // $routes->get('users/(:num)/edit', 'Admin\Users::edit/$1');
    // $routes->put('users/(:num)', 'Admin\Users::update/$1');
    // $routes->delete('users/(:num)', 'Admin\Users::delete/$1');
});