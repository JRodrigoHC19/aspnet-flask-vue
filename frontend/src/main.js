import './assets/main.css'
import 'bootstrap/dist/css/bootstrap.min.css'

import { createApp } from 'vue'
import App from './App.vue'

const app = createApp(App)

const ipAddress = process.env.IP_ADDRESS;
console.log(ipAddress);

app.mount('#app')
