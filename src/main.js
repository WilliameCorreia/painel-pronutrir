import Vue from "vue";
import App from "./App.vue";
import store from './store'
import router from './router'
import { Axios } from "axios";
import VueSwal from 'vue-swal';

if (!process.env.IS_WEB) Vue.use(require('vue-electron'))
Vue.http = Vue.prototype.$http = Axios
Vue.config.productionTip = false

Vue.use(VueSwal)

Vue.filter('trans', (value) => {
  return store.state.dict[value] || value
})

/* eslint-disable no-new */
new Vue({
  render: (h) => h(App),
  router,
  store,
  template: '<App/>',
  beforeCreate () {
    this.$store.dispatch('loadConfig')
  },
  mounted () {
    if (this.$electron) {
      this.$electron.ipcRenderer.on('navigate', (e, routePath) => {
        this.$router.push(routePath)
      })
    }
  }
}).$mount("#app");
