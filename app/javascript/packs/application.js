import "@hotwired/turbo-rails"
import "controllers"
import "jquery"

$(function(){
    $('#ask-button').click(function(){
      $('#ask-form').slideToggle(300);
      return false;
    });
  });
