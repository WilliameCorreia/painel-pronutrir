<template>
  <div class="history">
    <div v-if="messages.length===0" class="empty">
      <span>
        {{ 'history.empty'| trans }}
      </span>
    </div>
    <div v-for="message in messages" class="box_message" :key="message.id">
      <div class="item_message-history">
        <span class="title text-history" v-if="showMessageTitle">
        {{ message.title }}
        </span>
        <span class="subtitle text-history" v-if="showMessageSubtitle">
          {{ message.subtitle }}
        </span>
        <span class="description text-history" v-if="showMessageDescription">
          {{ message.description }}
        </span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'History',
  props: {
    messages: {
      required: true
    },
    fontColor: {
      type: String,
      default: '#000000'
    },
    showMessageTitle: {
      type: Boolean,
      default: true
    },
    showMessageSubtitle: {
      type: Boolean,
      default: true
    },
    showMessageDescription: {
      type: Boolean,
      default: false
    }
  }
}
</script>

<style lang="scss">
  .history {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-start;
  }
  .box_message {
    .item_message-history {
      display: flex;
      flex-shrink: 1;
      flex-direction: column;
      padding: 5px;
      margin-top: 20px;
      justify-content: center;
      align-items: center;
    }
  }
  .text-history {
    font-family: "Roboto";
    text-align: center;
    color: #e9e9e9;
  }
  .title {
    font-style: normal;
    font-weight: 600;
    letter-spacing: 6px;
    font-size: 1.5vw;
  }
  .subtitle {
    font-style: normal;
    font-weight: 600;
    font-size: 1.5vw;
  }
  .description {
    font-style: normal;
    font-weight: 600;
    font-size: 1vw;
  }
</style>
