<template>
  <div id="app">
    <div class="cards-containerClock" v-for="(computedClock, index) of computedRealClock" :key="index">
      <div class="containerClock">
        <div class="card bg-up">
          <div class="inner">
            <div class="content">
              {{ computedClock.nextFormat.slice(-2, -1) }}
            </div>
          </div>
        </div>
        <div class="card bg-down">
          <div class="inner">
            <div class="content">{{ computedClock.currentFormat.slice(-2, -1) }}</div>
          </div>
        </div>
        <div class="flip card" :style="computedClock.ifTens ? `transform: rotateX(-${computedClock.degree}deg);` : ''">
          <div class="front inner">
            <div class="content">
              {{ computedClock.currentFormat.slice(-2, -1) }}
            </div>
          </div>
          <div class="back inner">
            <div class="content">
              {{ computedClock.nextFormat.slice(-2, -1) }}
            </div>
          </div>
        </div>
      </div>
      <div class="containerClock">
        <div class="card bg-up">
          <div class="inner">
            <div class="content">
              {{ computedClock.nextFormat.slice(-1) }}
            </div>
          </div>
        </div>
        <div class="card bg-down">
          <div class="inner">
            <div class="content">{{ computedClock.currentFormat.slice(-1) }}</div>
          </div>
        </div>
        <div class="flip card" :style="`transform: rotateX(-${computedClock.degree}deg);`">
          <div class="front inner">
            <div class="content">
              {{ computedClock.currentFormat.slice(-1) }}
            </div>
          </div>
          <div class="back inner">
            <div class="content">
              {{ computedClock.nextFormat.slice(-1) }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>


export default {
  name: 'Clock',
  data() {
    return {
      curTime: new Date(0),
      realClock: [
        { max: 23, current: 0, degree: 0 },
        { max: 59, current: 0, degree: 0 },
       /*  { max: 59, current: 0, degree: 0 } */
      ],
    }
  },
  computed: {
    computedRealClock() {
      const { realClock } = this;
      return realClock.map((clock) => ({
        ...clock,
        nextFormat: `0${clock.current + 1 > clock.max ? 0 : clock.current + 1}`,
        currentFormat: `0${clock.current}`,
        ifTens: parseInt(clock.current / 10) !== parseInt((clock.current + 1) / 10)
      }));
    },
  },
  methods: {
    /**
     * index: 0 - hour, 1 - minute, 2 - second
     */
    flip(newVal, index = 2) {
      const clock = this.realClock[index];
      if (clock.degree < 180) {
        clock.degree += 4;
        requestAnimationFrame(() => {
          this.flip(newVal, index);
        });
      } else {
        clock.degree = 0;
        clock.current = newVal;
      }
    },
    timeFlies() {
      const newTime = new Date();
      if (newTime.getHours() !== this.curTime.getHours()) {
        requestAnimationFrame(() => {
          this.flip(newTime.getHours(), 0);
        });
      }
      if (newTime.getMinutes() !== this.curTime.getMinutes()) {
        requestAnimationFrame(() => {
          this.flip(newTime.getMinutes(), 1);
        });
      }
      if (newTime.getSeconds() !== this.curTime.getSeconds()) {
        requestAnimationFrame(() => {
          this.flip(newTime.getSeconds(), 2);
        });
      }
      this.curTime = newTime;
      requestAnimationFrame(this.timeFlies);
    },
  },
  created() {
    this.timeFlies();
  }
}
</script>

<style lang="scss">

#app {
  //height: 100%;
  //background: radial-gradient(ellipse at center, rgba(150, 150, 150, 1) 0%, rgba(89, 89, 89, 1) 100%);
  display: flex;
  //align-items: center;
  //justify-content: center;
  //position: absolute;
  //background-color: red;
}

.cards-containerClock {
  display: flex;
  position: relative;
}
.cards-containerClock + .cards-containerClock {
  margin-left: 10%;
  &::before {
    width: 20%;
    text-align: center;
    z-index: 1;
    position: absolute;
    left: -20%;
    top: 50%;
    transform: translateY(-60%);
    content: ':';
    font-family: "Roboto", Helvetica, Arial;
    color: #ccc;
    font-weight: bold;
    font-size: 5em;
    text-shadow: 1px 2px 2px rgba(0, 0, 0, 0.3);
  }
}

.containerClock {
  position: relative;
  width: 60px;
  height: 90px;
  perspective: 200px;
  position: relative;
  border-radius: 6px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, .4);
  &::after {
    content: '';
    position: absolute;
    left: 0;
    right: 0;
    height: 1px;
    background: rgba(0, 0, 0, .1);
    box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .4);
    top: calc(50% - 1px);
  }
}

.containerClock + .containerClock {
  margin-left: 15px;
}

.card {
  border-radius: 6px;
  position: absolute;
  font-family: "Roboto", Helvetica, Arial;
  font-size: 5em;
  text-align: center;
  line-height: 90px;
  width: 100%;
  height: 50%;
  transform-style: preserve-3d;
  transform-origin: 0% 100%;
}

.inner {
  border-radius: 6px 6px 0 0;
  position: absolute;
  width: 100%;
  height: 100%;
  background: #333;
  box-sizing: border-box;
  backface-visibility: hidden;
  overflow: hidden;
  .content {
    color: #ccc;
    font-weight: bold;
    text-shadow: 1px 2px 2px rgba(0, 0, 0, 0.3);
  }
}

// bg card
.bg-down {
  top: 50%;
  .inner {
    border-radius: 0 0 6px 6px;
  }
  .inner .content {
    transform: translateY(-50%);
  }
}

// flip card
.back {
  transform: rotateY(180deg);
  .content {
    transform-origin: 50% 50%;
    transform: rotate(180deg);
  }
}
</style>
