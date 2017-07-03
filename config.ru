require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
<<<<<<< HEAD
use SessionsController
use RegistrationsController
=======
use RegistrationsController
use SessionsController
>>>>>>> 171eec4562459fba1ab3c037033c39c6d7f49da6
use WorkoutsController
run ApplicationController
