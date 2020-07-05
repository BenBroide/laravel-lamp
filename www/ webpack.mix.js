<?php

    use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
root@8c6f890b89e5:/var/www/html/routes# cd ..
    root@8c6f890b89e5:/var/www/html# ls
README.md  bootstrap      config        phpunit.xml  routes      tests   webpack.mix.js
app        composer.json  database      public       server.php  var
    artisan    composer.lock  package.json  resources    storage     vendor
root@8c6f890b89e5:/var/www/html# cat webpack.mix.js
const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
