<template>
  <article class="about">
    <h1>{{ title }}</h1>
    <p>{{ description }}</p>
  </article>
</template>

<script>
export default {
  name: 'About',
  data() {
    return {
      title: 'About',
      description: 'Web Developer Engineer @ Eleven Labs',
    };
  },
};
</script>

<style scoped>
</style>
