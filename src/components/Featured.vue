<template>
  <div class="featured-message">
    <p class="description-text text">
      {{ message.description }}
    </p>
    <h1 class="title-text text">
      {{ message.title }}
    </h1>
    <h2 class="subtitle text text">
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
    display: flex;
    flex-direction: column;
    .text {
      font-family: "Roboto";
      
      font-size: 5em;
      text-align: center;
      color: #ccc;
      padding: 20px;
    }
    .description-text {
      font-style: normal;
      font-weight: 400;
    }
    .title-text {
      font-style: normal;
      font-weight: 600;
    }
    .subtitle-text {
      font-style: normal;
      font-weight: 400;
    }
  }
</style>
