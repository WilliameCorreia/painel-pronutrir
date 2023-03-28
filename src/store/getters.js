
export const theme = () => {
  return 'PronutrirTv'
}

export const message = state => {
  let message = state.messages[0]
  if (!message) {
    message = {
      id: 0,
      title: '',
      subtitle: '',
      description: ''
    }
  }
  return message
}

export const history = state => {
  return state.messages.slice(1)
}
