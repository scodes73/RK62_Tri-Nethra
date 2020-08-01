import firebase from "firebase/app";
import "firebase/storage";
require('firebase/auth');
require('firebase/firestore');

var firebaseConfig = {
  apiKey: "AIzaSyDHth5K5c58mgqAW4eEAaJUG_OqeuULR_g",
  authDomain: "webappmedia-2aa4d.firebaseapp.com",
  databaseURL: "https://webappmedia-2aa4d.firebaseio.com",
  projectId: "webappmedia-2aa4d",
  storageBucket: "webappmedia-2aa4d.appspot.com",
  messagingSenderId: "240907512606",
  appId: "1:240907512606:web:9f40c9af328f3adf60b70f",
};
firebase.initializeApp(firebaseConfig);
const storage = firebase.storage();
export { storage, firebase };
