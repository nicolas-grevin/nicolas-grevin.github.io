<template>
  <div id="header">
    <img :src="avatar" :alt="`avatar de ${name}`">
    <h1>{{ name }}</h1>
  </div>
</template>

<script>
import githubQueries from '../apollo/queries/github';

export default {
  name: 'Header',
  apollo: {
    avatar: githubQueries.apollo.avatar,
    name: githubQueries.apollo.name,
  },
  data() {
    return {
      name: '',
      avatar: '',
    };
  },
};
</script>

<style scoped>
  img {
    width: 25vh;
    border-radius: 50% 50%;
  }

  h1 {
    margin-top: 4vh;
    font-size: 5vh;
    font-weight: 900;
    text-transform: uppercase;
  }
</style>
