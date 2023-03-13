<template>
  <div class="layout-content">
    <div class="body-panel">
      <div class="featured-column">
        <iframe width="100%" height="100%" src="https://www.youtube.com/embed/q7zdJ-nMrlE?controls=0&amp;start=2" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
      </div>
      <div class="next-call-column">
        <div class="featured">
          <featured :message="lastMessage" v-if="lastMessage" @blink="playAudio" @speech="Speech" :fontColor="pageFontColor"></featured>
        </div>
        <div class="clock">
          <clock :locale="config.locale" :dateFormat="'date_format'|trans" :fontColor="config.clockFontColor"></clock>
        </div>
      </div>
    </div>
    <div class="footer-panel">
      <div class="titleFooter">
          <h2>
            {{ 'history.title'|trans }}
          </h2>
      </div>
      <history :messages="messages" v-if="lastMessage" ></history>
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
        console.log(this.$store.state.config);
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

        const senha = this.lastMessage.title.split('');
        senha.push(this.lastMessage.subtitle.split(' ').flat());

        speech.speechAll(senha, lang).then(() => {
          log('speechAll');
        }, (e) => {
          log('Testing error', e);
        });
      },
    }
  }
</script>

<style lang="scss">
  .layout-content {
    display: flex;
    background-color: #2f3033;
    flex-direction: column;
  }

  .body-panel {
    display: flex;
    flex: 5;
  }

  .footer-panel {
    flex: 1;
    flex-direction: column;
    display: flex;
    border-top-width: 5px; 
    border-left-width: 0;
    border-right-width: 0;
    border-bottom-width: 0;
    border-style: solid;
    border-color:  rgb(85, 85, 90);
    .titleFooter {
      h2{
        font-family: "Roboto", Helvetica, Arial;
        font-weight: 600;
        font-size: 2em;
        text-align: center;
        color: #ccc;
        align-self: center;
      }
    }
  }

  .next-call-column {
    display: flex;
    flex-direction: column;
    flex: 1;
    .featured {
      flex: 6;
    }
    .clock {
      background-color: transparent;
    }
  }

  .featured-column {
    flex: 1.8;
    border-top-width: 0; 
    border-left-width: 0;
    border-right-width: 5px;
    border-bottom-width: 0;
    border-style: solid;
    border-color:  rgb(85, 85, 90);

  /* .history-column {
    display: flex;
    flex: 1;
    background-color: rgb(212, 223, 217);
  } */

}
</style>