import Vue from 'vue';
import VueApollo from 'vue-apollo';
import App from './App';
// import router from './router';
import apolloClient from './apollo';
import githubQueries from './apollo/queries/github';

Vue.config.productionTip = false;

const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
});

/* eslint-disable no-new */
new Vue({
  el: '#app',
  // router,
  apolloProvider,
  apollo: githubQueries,
  render: h => h(App),
});
