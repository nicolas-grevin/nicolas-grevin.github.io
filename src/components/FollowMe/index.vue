<template>
  <article class="follow-me">
    <h1>{{ title }}</h1>
    <aside v-for="socialNetwork in socialNetworks" :key="socialNetwork.name">
      <a :href="socialNetwork.link">
        <img :src="socialNetwork.icon.path" :alt="socialNetwork.icon.alt"/>
      </a>
    </aside>
  </article>
</template>

<script>
import githubIcon from '../../assets/img/icon/github-logo.svg';
import dockerIcon from '../../assets/img/icon/docker-logo.svg';
import twitterIcon from '../../assets/img/icon/twitter-logo.svg';
import linkedinIcon from '../../assets/img/icon/linkedin-logo.svg';

export default {
  name: 'FollowMe',
  data() {
    return {
      title: 'Follow Me',
      socialNetworks: [
        {
          name: 'github',
          link: 'https://github.com/nicolas-grevin',
          icon: {
            path: githubIcon,
            alt: 'icon github logo',
          },
        },
        {
          name: 'docker',
          link: 'https://hub.docker.com/u/nicolasgrevin/',
          icon: {
            path: dockerIcon,
            alt: 'icon docker logo',
          },
        },
        {
          name: 'twitter',
          link: 'https://twitter.com/nicolas_grevin',
          icon: {
            path: twitterIcon,
            alt: 'icon twitter logo',
          },
        },
        {
          name: 'linkedin',
          link: 'https://www.linkedin.com/in/nicolas-grévin/',
          icon: {
            path: linkedinIcon,
            alt: 'icon linkedin logo',
          },
        },
      ],
    };
  },
};
</script>

<style scoped>
  aside{
    width: 80vw;
    margin: auto;
    display: flex;
    flex: 1;
    flex-direction: row;
    justify-content: space-evenly;
  }

  aside a img {
    width: 7.5vh;
  }
</style>
