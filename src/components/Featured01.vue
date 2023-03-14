<template>
  <div class="featured-message">
    <p class="description text-featured">
      {{ message.description }}
    </p>
    <h1 class="title text-featured">
      <!-- {{ message.title }} -->
      WILLIAME CORREIA DE LIMA
    </h1>
    <h2 class="subtitle text-featured">
      {{ message.subtitle }}
    </h2>
  </div>
</template>

<script>
import Queue from 'promise-queue';

const queue = new Queue(1, 10);

function toggleVisibility (el) {
  if (el.style.visibility === 'hidden') {
    el.style.visibility = 'visible'
  } else {
    el.style.visibility = 'hidden'
  }
}

function blinkElement (el, count, resolve) {
  toggleVisibility(el);

  if (count > 0) {
    setTimeout(() => blinkElement(el, count - 1, resolve), 200);
  } else {
    setTimeout(() => resolve(), 1000);
  }
}

export default {
  name: 'Featured',
  props: {
    message: {
      required: true
    },
    fontColor: {
      type: String,
      default: '#000000'
    }
  },
  data () {
    return {}
  },
  methods: {
    blink () {
      this.$emit('blink');
      this.$emit('speech');
      return new Promise((resolve) => {
        blinkElement(this.$el, 5, resolve);
      });
    }
  },
  watch: {
    message () {
      queue.add(this.blink);
    }
  },
}
</script>

<style lang="scss">
  .featured-message {
    flex: 1;
    display: flex;
    flex-direction: column;
    .text-featured {
      font-family: "Roboto";
      text-align: center;
      color: #ccc;
      padding: 10px;
    }
    .title {
      font-style: normal;
      font-weight: 600;
      letter-spacing: 6px;
      font-size: 3.5vw;
    }
    .subtitle {
      font-style: normal;
      font-weight: 600;
      font-size: 3vw;
    }
    .description {
      font-style: normal;
      font-weight: 600;
      font-size: 2vw;
    }
  }
</style>
