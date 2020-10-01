const notifier = require('node-notifier'), notify = () => {
  notifier.notify({
    title : 'Eye Break',
    message : 'Time to rest your eyes',
    icon : './logo.jpg'
  });

  setTimeout(function() {
    notifier.notify({
      title : 'Eye Break',
      message : 'You can continue your work now',
      icon : './logo.jpg'
    });
  }, 30000);
  setTimeout(notify, 1800000);
};

notify();