// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails


// no need to require jQuery because it already comes with datatables
//- require jquer y3

//= require popper
//= require bootstrap-sprockets
import 'datatables.net';
import "@hotwired/turbo-rails"

//disable turbo
Turbo.session.drive = false

import "controllers"
import 'echarts'

