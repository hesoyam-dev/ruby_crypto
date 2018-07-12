$:.unshift File.expand_path(__FILE__);
require 'sinatra'
require_relative './config/environment'


use Rack::MethodOverride
use DashboardsController
use UsersController
run ApplicationController
