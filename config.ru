require './config/environment'

use ProjectController
use UserController
use Rack::MethodOverride
run ApplicationController
