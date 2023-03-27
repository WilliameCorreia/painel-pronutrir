function speechQueue (speech, texts, lang, index) {
  return new Promise((resolve, reject) => {
    if (texts.length === 0 || index >= texts.length) {
      resolve()
      return
    }

    let text = texts[index]
   
    speech(text, lang).then(() => {
      speechQueue(speech, texts, lang, index + 1)
    }, reject)
  })
}

export default {

  getVoice (name) {
    return new Promise(resolve => {
      window.speechSynthesis.onvoiceschanged = () => {
        const voices = name ? window.speechSynthesis.getVoices().filter(item => item.name === name)[0] : 
        window.speechSynthesis.getVoices().filter(item => item.lang === "pt-BR")[0];
        console.log(voices);
        resolve(voices);
      }
    });
  },

  getVoicesFilter () {
    //return window.speechSynthesis.getVoices().filter(item => item.lang === "pt-BR");
    return window.speechSynthesis.getVoices();
  },

  speech (text, lang, voice) {

    return new Promise((resolve, reject) => {
      const msg = new SpeechSynthesisUtterance();
      msg.text = text;
      msg.lang = lang;
      msg.voice = voice;

      msg.onerror = reject;
      msg.onend = resolve;
      msg.rate = 1;

      speechSynthesis.speak(msg);
    })
  },

  speechAll (texts, lang) {
    return speechQueue(this.speech, texts, lang, 0);
  }
}
