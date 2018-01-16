<template>
  <div id="header">
    <img :src="profilePicture.path" :alt="profilePicture.alt">
    <h1>{{ name }}</h1>
  </div>
</template>

<script>
import profilePicturePath from '../assets/img/profile_picture_circle_nicolas_grevin.png';

export default {
  name: 'Header',
  data() {
    return {
      name: 'nicolas grévin',
      profilePicture: {
        path: profilePicturePath,
        alt: 'profile_picture_circle_nicolas_grevin',
      },
    };
  },
};
</script>

<style scoped>
</style>
