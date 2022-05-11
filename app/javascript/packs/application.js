// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require rails.validations

//= require jquery_ujs
//= require bootstrap
//= require bindWithDelay
//= require jquery.datetimepicker
//= require_tree .

// If you are using `import` syntax
import '@client-side-validations/client-side-validations/src'

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


// If you are using `require` syntax
require('@client-side-validations/client-side-validations')

require('packs/social-share-button.js.erb')
#= require social-share-button
require("jquery")
Rails.start()
Turbolinks.start()
ActiveStorage.start()

@import "bootstrap-sprockets";
@import "bootstrap";
@import "font-awesome";
@import "jquery.datetimepicker";
@import "*";
