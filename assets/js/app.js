import 'phoenix_html'
import socket from './socket'

import Vue from 'vue'
import Test from './components/Test.vue'

new Vue({
  el: '#app',
  render: h => h(Test)
});
