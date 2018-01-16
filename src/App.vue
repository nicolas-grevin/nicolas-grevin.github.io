<template>
  <div id="app">
    <Header />
    <About/>
  </div>
</template>

<script>
import Header from '@/components/Header';
import About from '@/components/About';

export default {
  name: 'App',
  components: {
    Header,
    About,
  },
};
</script>

<style>

</style>
