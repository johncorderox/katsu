// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require materialize
//= require Chart.bundle
//= require chartkick

$(document).ready(function(){

  // call the date picker popup for Registration/edit
  $('.datepicker').pickadate({
    format: 'mm.dd.yyyy',
    selectYears: 99,
    selectMonths: true,
  });

  $('#find').on("click", function(){

    const query = $('#query').val();

    $.get("https://api.giphy.com/v1/gifs/search?api_key=nRK4UnJKsEepJVhU6xdBCrQuVP5tH09R&q="+query+"&limit=48&offset=0&rating=PG&lang=en", function(res) {
       for ( var i = 0; i < res.data.length; i++) {
        var url = res.data[i].images.original.url;
        var code = "<input type=\"image\" name=\"mood[url]\" value=\""+url+"\" src=\""+url+"\"/> <input type=\"hidden\" name=\"mood[mood]\" value=\""+query+"\">";

         $('#form-finish').css("height", "450px");
         $('#form-finish').css("overflow", "scroll");
         $('#form-finish').append(code);
        }
    }, "json");

  });


});
