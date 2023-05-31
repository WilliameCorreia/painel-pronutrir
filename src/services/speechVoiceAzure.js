import axios from 'axios';

const ApiSpeechVoiceAzure = axios.create({
  baseURL: "https://eastus.tts.speech.microsoft.com/cognitiveservices/voices",
  headers: {
    "Ocp-Apim-Subscription-Key": "15e7288f14af431985c1284a74732c69",
  }
});

export async function getSpeechVoice () {
  const result = (await ApiSpeechVoiceAzure.get('/list')).data;
  return result.filter((item) => item.Locale === "pt-BR" );
}

export async function speechVoice (texts, voice) {
  const resp = await fetch("https://eastus.tts.speech.microsoft.com/cognitiveservices/v1", {
      "headers": {
        "content-type": "application/ssml+xml",
        "Ocp-Apim-Subscription-Key": "15e7288f14af431985c1284a74732c69",
        "X-Microsoft-OutputFormat": "audio-16khz-128kbitrate-mono-mp3"
      },
      "body": `<speak version='1.0' xml:lang='pt-BR'><voice xml:lang='pt-BR' xml:gender='Female' name='${voice}'><prosody rate='-15.00%'>${texts}</prosody></voice></speak>`,
      "method": "POST"
    });
    
    const blob = await resp.blob();
    const url = URL.createObjectURL(blob);
  
    const audio = new Audio();
  
    audio.src = url;
    audio.play();
}

export default ApiSpeechVoiceAzure;