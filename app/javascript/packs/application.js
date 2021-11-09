// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "popper.js"
import "bootstrap"
import "bootstrap-icons/font/bootstrap-icons.css"
import "bootstrap-datepicker/dist/css/bootstrap-datepicker.css"

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("popper.js");
require("bootstrap");
require("bootstrap-datepicker");
import "../stylesheets/application";

$(document).ready(function(){
    console.log("aaa");

});

document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
        $('[data-toggle="popover"]').popover();

        $('.datepicker').datepicker({ format: 'yy-mm-dd', startDate: '01/01/1990' });

    })
})
