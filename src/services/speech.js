function speechQueue (speech, texts, lang, index, voice) {
  return new Promise((resolve, reject) => {
    if (texts.length === 0 || index >= texts.length) {
      resolve()
      return
    }

    let text = texts[index]
   
    speech(text, lang, voice).then(() => {
      speechQueue(speech, texts, lang, index + 1)
    }, reject)
  })
}

export default {

  getVoice (name) {
    return new Promise(resolve => {
      window.speechSynthesis.onvoiceschanged = () => {
        const voice = name ? window.speechSynthesis.getVoices().filter(item => item.name === name)[0] : 
        window.speechSynthesis.getVoices().filter(item => item.lang === "pt-BR")[0];
        resolve(voice);
      }
    });
  },

  getVoicesFilter () {
    return window.speechSynthesis.getVoices().filter(item => item.lang === "pt-BR");
  },

  speech (text, lang, voiceName) {

    return new Promise((resolve, reject) => {
      const msg = new SpeechSynthesisUtterance();
      msg.text = text;
      msg.lang = lang;
      msg.voice = window.speechSynthesis.getVoices().filter(item => item.name === voiceName)[0];

      msg.onerror = reject;
      msg.onend = resolve;
      msg.rate = 1;

      speechSynthesis.speak(msg);
    })
  },

  speechAll (texts, lang, voice) {
    return speechQueue(this.speech, texts, lang, 0, voice);
  }
}
