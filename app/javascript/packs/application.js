import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import "../stylesheets/index.scss"

require("jquery")
require("packs/admin")


Rails.start()
Turbolinks.start()
ActiveStorage.start()
