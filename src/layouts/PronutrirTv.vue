<template>
  <div class="layout-content">
    <div class="body-panel">
      <div class="video-column-panel">
        <iframe id="ytplayer" type="text/html" width="100%" height="100%"
          src="https://www.youtube.com/embed/?autoplay=1&mute=1&loop=1&controls=0&modestbranding=1&playlist=3SsK-cxlj_w,0GZSfBuhf6Y,b7FNvq11CEw,7lvXbfNBIQg,7lvXbfNBIQg&playsinline=1&start=01"
          frameborder="0" allowfullscreen></iframe>
        <!-- <iframe width="100%" height="100%" src="https://www.youtube.com/embed/3SsK-cxlj_w?playlist=0GZSfBuhf6Y,b7FNvq11CEw,7lvXbfNBIQg,7lvXbfNBIQg&version=3&autoplay=1&cc_load_policy=1&controls=0&disablekb=1&fs=0&hl=pt-BR" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> -->
      </div>
      <div class="history-column-panel">
        <div class="titleHistory">
          <h2>
            {{ 'history.title'|trans }}
          </h2>
        </div>
         <history :messages="messages" v-if="lastMessage" ></history>
        <div class="clock">
          <clock :locale="config.locale" :dateFormat="'date_format'|trans" :fontColor="config.clockFontColor"></clock>
        </div>
      </div>
    </div>
    <div class="footer-panel">
      <div class="featured">
        <featured :message="lastMessage" v-if="lastMessage" @blink="playAudio" @speech="Speech" :fontColor="pageFontColor"></featured>
      </div>
    </div>
  </div>
</template>

<script>
  import Featured from '@/components/Featured.vue';
  import History from '@/components/History.vue';
  import Clock from '@/components/Clock.vue';
  import audio from '@/services/audio';
  import speech from '@/services/speech';
  import { log } from '@/util/functions';

  export default {
    name: 'PronutrirTv',
    components: {
      Clock,
      Featured,
      History
    },
    computed: {
      messages () {
        return this.$store.getters.history;
      },
      lastMessage () {
        return this.$store.getters.message;
      },
      config () {
        return this.$store.state.config;
      },
      logoUrl () {
        return require('@/assets/images/svg/logo.svg');
      },
      pageBgColor () {
        const peso = this.lastMessage.$data ? this.lastMessage.$data.peso : 1;
        return peso > 0 ? this.config.pageBgColorPriority : this.config.pageBgColorNormal;
      },
      pageFontColor () {
        const peso = this.lastMessage.$data ? this.lastMessage.$data.peso : 1;
        return peso > 0 ? this.config.pageFontColorPriority : this.config.pageFontColorNormal;
      }
    },
    methods: {
      playAudio () {
        audio.playAlert(this.config.alert);
      },
      Speech () {
        const lang = this.config.locale || 'pt-BR';

        setTimeout(() => {
            speech.speechAll([this.lastMessage.title, this.lastMessage.subtitle], lang, this.$store.state.config.voice).then(() => {
            log('speechAll');
          }, (e) => {
            log('Testing error', e);
          });          
        }, 2000);

      },
    }
  }
</script>

<style lang="scss">
  .layout-content {
    flex: 1;
    display: flex;
    background-color: #038C8C;
    flex-direction: column;
  }

  .body-panel {
    flex: 5;
    display: flex;
  }

  .video-column-panel {
    flex: 4;
    border-top-width: 0; 
    border-left-width: 0;
    border-right-width: 5px;
    border-bottom-width: 0;
    border-style: solid;
    border-color:  #20c4cb;
  }

  .history-column-panel {
    flex: 1.2;
    display: flex;
    flex-direction: column;
    padding-top: 10px;
    h2{
        font-family: "Roboto", Helvetica, Arial;
        font-weight: 600;
        font-size: 2vw;
        text-align: center;
        color: #ccc;
        align-self: center;
      }
    .clock {
      background-color: transparent;
    }
  }

  .footer-panel {
    flex: 1;
    display: flex;
    flex-direction: column;
    border-top-width: 5px; 
    border-left-width: 0;
    border-right-width: 0;
    border-bottom-width: 0;
    border-style: solid;
    border-color:  #20c4cb;
  }

</style>