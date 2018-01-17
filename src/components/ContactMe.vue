<template>
  <article class="contact-me">
    <h1>{{ title }}</h1>
    <p>{{ email }}</p>
  </article>
</template>

<script>
import gql from 'graphql-tag';

export default {
  name: 'ContactMe',
  apollo: {
    login: {
      query: gql`{
        viewer {
          login
        }
      }`,
      update(data) {
        return data.viewer.login;
      },
    },
  },
  data() {
    return {
      title: 'contact me',
      email: 'contact@nicolas-grevin.com',
      login: '',
    };
  },
};
</script>

<style scoped>
</style>
