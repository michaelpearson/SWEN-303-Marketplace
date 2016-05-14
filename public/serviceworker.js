self.addEventListener('push', function(event) {
    fetch('/pull', {credentials: 'include'}).then(function (resp) {
        resp.json().then(function (response) {
            var notification = {};
            for(var a = 0;a < response.notifications.length;a++) {
                if(!response.notifications[a].seen) {
                    notification = response.notifications[a];
                    var title = notification.title;
                    var body = notification.description;
                    var icon = notification.icon;

                    self.registration.showNotification(title, {
                        body: body,
                        icon: icon
                    });
                }
            }
        });
    });
});