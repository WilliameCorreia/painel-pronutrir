
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

  speech (text, lang) {

    //const voice = window.speechSynthesis.getVoices()[1];

    return new Promise((resolve, reject) => {
      const msg = new SpeechSynthesisUtterance();
      msg.text = text;
      msg.lang = lang;
      //msg.voice = voice();

      msg.onerror = reject;
      msg.onend = resolve;
      msg.rate = 0.8;

      speechSynthesis.speak(msg);
    })
  },

  speechAll (texts, lang) {
    return speechQueue(this.speech, texts, lang, 0);
  }
}
