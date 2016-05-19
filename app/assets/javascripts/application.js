//= require jquery
//= require bootstrap-sprockets

if ('serviceWorker' in navigator) {
    navigator.serviceWorker.register('/serviceworker.js').then(subscribe);
}

function subscribe() {
    navigator.serviceWorker.ready.then(function(serviceWorkerRegistration) {
        serviceWorkerRegistration.pushManager.subscribe({
            userVisibleOnly: true
        }).then(function(subscription) {
            var endpoint = subscription.endpoint;
            $.ajax('/users/register_push', {
                method: 'post',
                data: {
                    url: endpoint
                }
            });
        });
    });
}

$(document).ready(function () {
  var trigger = $('.hamburger'),
      overlay = $('.overlay'),
     isClosed = false;

    trigger.click(function () {
      hamburger_cross();      
    });

    overlay.click(function () {
      hamburger_cross();      
    });

    function hamburger_cross() {

      if (isClosed == true) {          
        overlay.hide();
        trigger.removeClass('is-open');
        trigger.addClass('is-closed');
        isClosed = false;
      } else {   
        overlay.show();
        trigger.removeClass('is-closed');
        trigger.addClass('is-open');
        isClosed = true;
      }
  }
  
  $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
  });  
});