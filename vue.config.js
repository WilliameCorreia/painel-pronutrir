module.exports = {
  pluginOptions: {
    electronBuilder: {
      nodeIntegration: true,
      builderOptions: {
        mac: {
          icon: "./src/assets/images/logo/logo512x512.png"
        },
        win: {
          icon: "./src/assets/images/logo/logo256x256.png"
        },
        linux: {
          icon: "./src/assets/images/logo/logo512x512.png"
        }
      }
    },
  },
};
