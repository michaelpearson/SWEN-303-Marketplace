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