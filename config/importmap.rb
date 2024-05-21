# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"


# we use jquery that comes with datatables
pin "datatables.net", to: "https://cdn.datatables.net/v/bs5/jq-3.7.0/dt-2.0.3/datatables.min.js" # @2.0.3
#pin "jquery", to: "https://esm.sh/jquery@3.7.0" # @3.7.1
#pin "jquery" # @3.7.1

# echarts
pin "echarts", to: 'echarts.min.js'
