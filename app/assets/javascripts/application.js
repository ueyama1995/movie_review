// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.raty.js
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

/*global $*/
$(document).on('turbolinks:load',function(){
  $('.review-value').raty({
    starOff: (typeof starOffImage != "undefined")?starOffImage.getAttribute('src').replace('/assets/', ''):'star-off.png',
    starOn: (typeof starOnImage != "undefined")?starOnImage.getAttribute('src').replace('/assets/', ''):'star-on.png',
    starHalf: (typeof starHalfImage != "undefined")?starHalfImage.getAttribute('src').replace('/assets/', ''):'star-half.png',
    readOnly: true,
    score: function() {
    },
    path: '/assets/',
    number: 5
  });

  console.log("application.js")
})
