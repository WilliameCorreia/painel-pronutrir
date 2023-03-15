
export default {

  alertsAvailable: {
    'Default': 'dingdong.mp3',
    'cowbells01': 'cowbells01.mp3',
    'Ding dong': 'subway.mp3',
    'electronicchime': 'electronicchime.mp3',
    'jinglebells': 'jinglebells.mp3',
    'soundeffect': 'soundeffect.mp3',
    'zvonekdoma': 'zvonekdoma.mp3',
  },

  playAlert (filename) {
    return new Promise((resolve, reject) => {
      filename = this.alertsAvailable.Default

      const audio = new Audio();
      audio.src = require(`@/assets/sound/alert/${filename}`);
      audio.onended = resolve;
      audio.onerror = reject;
      audio.play();
    })
  }
}
