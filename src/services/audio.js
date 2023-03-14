
export default {

  alertsAvailable: {
    'Default': 'ekigaVm.wav',
    'Airport Bingbong': 'airportBingbong.wav',
    'Ding dong': 'dingDong.wav',
    'Doorbell Bingbong': 'doorbellBingbong.wav',
    'Info bleep': 'infobleep.wav',
    'Quito Mariscal sucre': 'quitoMariscalSucre.wav',
    'Toy doorbell': 'toydoorbell.wav'
  },

  playAlert (filename) {
    return new Promise((resolve, reject) => {
      filename = filename || this.alertsAvailable.Default

      const audio = new Audio()
      audio.src = require(`@/assets/sound/alert/${filename}`);
      audio.onended = resolve
      audio.onerror = reject
      audio.play()
    })
  }
}
