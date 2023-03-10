<template>
  <div class="layout-content">
    <div class="body-panel">
      <div class="featured-column">
        <iframe width="100%" height="100%" src="https://www.youtube.com/embed/q7zdJ-nMrlE?controls=0&amp;start=2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
      </div>
      <div class="next-call-column">
        <header>
          <h2 class="title" :style="{ 'color': config.sidebarFontColor }">
            {{ 'history.title'|trans }}
          </h2>
          <history :messages="messages" v-if="lastMessage" :fontColor="config.sidebarFontColor"></history>
        </header>
        <div :style="{'position': 'absolute', 'bottom': 0}">
          <clock :locale="config.locale" :dateFormat="'date_format'|trans" :fontColor="config.clockFontColor"></clock>
        </div>
      </div>
    </div>
    <div class="footer-panel">
      <featured :message="lastMessage" v-if="lastMessage" @blink="playAudio" :fontColor="pageFontColor"></featured>
    </div>
  </div>
</template>

<script>
  import Clock from '@/components/Clock.vue';
  import Featured from '@/components/Featured.vue'
  import History from '@/components/History.vue';
  import audio from '@/services/audio';

  export default {
    name: 'PronutrirTv',
    components: {
      Clock,
      Featured,
      History
    },
    computed: {
      messages () {
        return this.$store.getters.history
      },
      lastMessage () {
        return this.$store.getters.message
      },
      config () {
        console.log(this.$store.state.config);
        return this.$store.state.config
      },
      logoUrl () {
        return require('@/assets/images/svg/logo.svg');
      },
      pageBgColor () {
        const peso = this.lastMessage.$data ? this.lastMessage.$data.peso : 1
        return peso > 0 ? this.config.pageBgColorPriority : this.config.pageBgColorNormal
      },
      pageFontColor () {
        const peso = this.lastMessage.$data ? this.lastMessage.$data.peso : 1
        return peso > 0 ? this.config.pageFontColorPriority : this.config.pageFontColorNormal
      }
    },
    methods: {
      playAudio () {
        audio.playAlert(this.config.alert)
      }
    }
  }
</script>

<style lang="scss">
  .layout-content {
    display: flex;
    //background-color: red;
    flex-direction: column;
  }

  .body-panel {
    display: flex;
    flex: 1.5;
    background-color: rgb(99, 18, 75);
  }

  .footer-panel {
    justify-content: center;
    align-items: center;
    display: flex;
    flex: 1;
    background-color: rgb(146, 113, 22);
  }

  .next-call-column {
    flex: 1;
    background-color: rgb(18, 83, 43);
  }

  .featured-column {
    flex: 2;
    background-color: rgb(24, 18, 83);
    header {
      width: 100%;
        height: 80%;
    }
    footer {
      height: 20vh;
      padding: 1vh;
      img {
        height: 10vh
      }
    }
    .featured-message {
      text-align: center;
      .title {
        font-size: 30vh;
        font-weight: bold;
      }
      .subtitle{
        font-size: 10vh;
      } 
      .description{
        font-size: 10vh
      }
    }

  .history-column {
    //display: flex;
    //flex: 1;
    //background-color: rgb(212, 223, 217);
  }

  }

</style>

<!-- <style lang="sass">
  
  .history-column
    height: 100vh
    header
      height: 80vh
      padding: 1rem 0
    footer
      height: 20vh
      padding: 1rem 0
      text-align: center
    *
      color: #2c3e50
    .title
      text-align: center
      font-weight: bold
    .message
      background-color: transparent
      border-left: 8px solid rgba(0,0,0,.3)
      padding-left: 2rem
      margin-bottom: 1rem
    .empty
      p
        font-style: italic
        text-align: center
    .history
      .message
        span
          text-align: left
          display: block
        .title
          font-size: 8vh
          font-weight: bold
        .subtitle
          font-size: 4vh
          font-style: italic
</style> -->
