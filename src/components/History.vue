<template>
  <div class="history">
    <div v-if="messages.length===0" class="empty">
      <span>
        {{ 'history.empty'| trans }}
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
    display: flex;
    justify-content: flex-start;
    align-items: center;
  }
  .box_message {
    display: flex;
    flex-direction: row;
    padding-left: 15px;
    padding-right: 15px;
    .item_message {
      display: flex;
      flex-shrink: 1;
      flex-direction: column;
      padding: 5px;
      margin: 5px;
      justify-content: center;
      align-items: center;
    }
 }
</style>
