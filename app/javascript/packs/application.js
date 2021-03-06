// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("app")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


import Vue from 'vue/dist/vue.esm'
import TeamSheetForm from '../team_sheet_form.vue'
import VueResource from 'vue-resource'

Vue.use(VueResource)

Vue.component('team_sheet_form', TeamSheetForm)
document.addEventListener('DOMContentLoaded', () => {
    Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    new Vue({
        el: '[data-behaviour="vue"]',
    });
})
