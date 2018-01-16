<template>
  <div class="follow-me">

  </div>
</template>

<script>


export default {
  name: 'FollowMe',
  data() {
    return {
      socialNetworks: [
        {
          name: 'github',
          link: '',
          icon: {
            path: '',
            alt: '',
          },
        },
        {
          name: 'docker',
          link: '',
          icon: {
            path: '',
            alt: '',
          },
        },
        {
          name: 'twitter',
          link: '',
          icon: {
            path: '',
            alt: '',
          },
        },
        {
          name: 'linkedin',
          link: '',
          icon: {
            path: '',
            alt: '',
          },
        },
      ],
    };
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
