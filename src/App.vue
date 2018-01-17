<template>
  <div id="app">
    <header>
      <Header />
    </header>
    <main>
      <about/>
      <follow-me />
      <contact-me />
    </main>
    <footer></footer>
  </div>
</template>

<script>
import Header from '@/components/Header';
import About from '@/components/About';
import FollowMe from '@/components/FollowMe';
import ContactMe from '@/components/ContactMe';

export default {
  name: 'App',
  components: {
    Header,
    About,
    FollowMe,
    ContactMe,
  },
};
</script>

<style>
  @import "styles/reset.css";

  html, body, #app {
    width: 100%;
    height: 100%;
  }

  body {
    text-align: center;
    font-family: monospace;
  }

  p {
    font-size: 2.5vh;
  }

  #app {
    display: grid;
    grid-template-columns: auto;
    grid-template-rows: 40vh 1fr 3vh;
    grid-template-areas: "h"
    "m"
    "f";
  }

  header {
    grid-area: h;
    align-self: center;
  }

  main {
    grid-area: m;
    display: flex;
    flex: 1;
    flex-direction: column;
    justify-content: space-evenly;
  }

  article h1 {
    display: block;
    margin-bottom: 2vh;
    font-size: 4vh;
  }

  footer {
    grid-area: f;
  }
</style>
