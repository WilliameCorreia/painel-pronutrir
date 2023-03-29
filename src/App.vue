<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
  export default {
    name: 'painel-web'
  }
</script>

<style>
  @import "~bulma/css/bulma.css";
  @import "~font-awesome/css/font-awesome.min.css";
  @import "./assets/css/app.css";

  /* Thin */
@font-face {
    font-family: 'Roboto';
    src: url(./assets/fonts/Roboto-Thin.ttf) format('truetype');
    font-style: normal;
    font-weight: 100;
}

  /* Thin italic */
  @font-face {
    font-family: 'Roboto';
    src: url(./assets/fonts/Roboto-ThinItalic.ttf) format('truetype');
    font-style: italic;
    font-weight: 100;
}

/* Light */
@font-face {
    font-family: 'Roboto';
    src: url(./assets/fonts/Roboto-Light.ttf) format('truetype');
    font-style: normal;
    font-weight: 300;
}

/* Light italic */
@font-face {
    font-family: 'Roboto';
    src: url(./assets/fonts/Roboto-LightItalic.ttf) format('truetype');
    font-style: italic;
    font-weight: 300;
}

/* Normal */
@font-face {
    font-family: 'Roboto';
    src: url(./assets/fonts/Roboto-Regular.ttf) format('truetype');
    font-style: normal;    
    font-weight: 400;
}

/* Medium */
@font-face {
    font-family: 'Roboto';
    src: url(./assets/fonts/Roboto-Medium.ttf) format('truetype');
    font-style: normal;
    font-weight: 500;
}

/* Medium italic */
@font-face {
    font-family: 'Roboto';
    src: url(./assets/fonts/Roboto-MediumItalic.ttf) format('truetype');
    font-style: italic;
    font-weight: 500;
}

/* Bold */
@font-face {
    font-family: 'Roboto';
    src: url(./assets/fonts/Roboto-Bold.ttf) format('truetype');
    font-style: normal;    
    font-weight: 700;
}

/* Bold italic */
@font-face {
    font-family: 'Roboto';
    src: url(./assets/fonts/Roboto-BoldItalic.ttf) format('truetype');
    font-style: italic;    
    font-weight: 700;
}

/* Black */
@font-face {
    font-family: 'Roboto';
    src: url(./assets/fonts/Roboto-Black.ttf) format('truetype');
    font-style: normal;
    font-weight: 900;
}

/* Black */
@font-face {
    font-family: 'Roboto';
    src: url(./assets/fonts/Roboto-BlackItalic.ttf) format('truetype');
    font-style: italic;
    font-weight: 900;
}
</style>
