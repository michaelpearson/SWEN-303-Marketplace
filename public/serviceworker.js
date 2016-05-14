self.addEventListener('push', function(event) {
    fetch('/pull', {credentials: 'include'}).then(function (resp) {
        resp.json().then(function (response) {
            var notification = {};
            for(var a = 0;a < response.notifications.length;a++) {
                notification = response.notifications[a];
                var title = notification.title;
                var body = notification.description;
                var icon = notification.icon;
                self.registration.showNotification(title, {
                    body: body,
                    icon: icon,
                    tag : notification.stock_id
                });
            }
        });
    });
});
self.addEventListener('notificationclick', function(event) {
    event.notification.close();
    clients.openWindow('/stocks/' + event.notification.tag);
});