import gql from 'graphql-tag';

export default {
  apollo: {
    avatar: {
      query: gql`{
      viewer {
        avatarUrl
      }
    }`,
      update: data => data.viewer.avatarUrl,
      prefetch: true,
    },
    name: {
      query: gql`{
      viewer {
        name
      }
    }`,
      update: data => data.viewer.name,
      prefetch: true,
    },
    login: {
      query: gql`{
        viewer {
          login
        }
      }`,
      update: data => data.viewer.login,
      prefetch: true,
    },
  },
};
