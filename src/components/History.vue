<template>
  <div class="history">
    <div v-if="messages.length===0" class="empty">
      <span>
        {{ 'history.empty'|trans }}
      </span>
    </div>
    <div v-for="message in messages" class="box_message" :key="message.id">
      <div class="item_message">
        <span class="title" v-if="showMessageTitle">
        {{ message.title }}
        </span>
        <span class="subtitle" v-if="showMessageSubtitle">
          {{ message.subtitle }}
        </span>
        <span class="description" v-if="showMessageDescription">
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
  }
  .box_message {
    padding-left: 10px;
    padding-right: 10px;
    display: flex;
    .item_message {
      padding-left: 10px;
      padding-right: 10px;
      background-color: aqua;
    }
    span {
      font-family: "Roboto", Helvetica, Arial;
      font-weight: 100;
      font-size: 2em;
      text-align: center;
      line-height: 90px;
      color: #ccc;
      padding-top: 20px;
      padding-bottom: 20px;
    }
 }
</style>
