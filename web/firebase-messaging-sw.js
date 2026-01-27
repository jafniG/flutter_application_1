importScripts("https://www.gstatic.com/firebasejs/9.19.1/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.19.1/firebase-messaging-compat.js");

firebase.initializeApp({
    apiKey: 'AIzaSyCg-OIYQM2BbNGo18PRKh1HlR8xw6d73ik',
    appId: '1:156198589336:web:a80f48c1bbf62a422751ed',
    messagingSenderId: '156198589336',
    projectId: 'sample-db11c',
    authDomain: 'sample-db11c.firebaseapp.com',
    storageBucket: 'sample-db11c.firebasestorage.app',
    measurementId: 'G-EPWFK70CTS',
 
});

const messaging = firebase.messaging();

// Handle background messages
messaging.onBackgroundMessage(async (payload) => {
  console.log('Received background message:', payload);

  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: '/icons/Icon-192.png',
    badge: '/icons/Icon-192.png',
    data: payload.data,
    click_action: payload.notification.click_action,
  };

  self.registration.showNotification(notificationTitle, notificationOptions);
});