App.messages = App.cable.subscriptions.create('MessagesChannel', {
  reveived: (data) => {
    let msg = '<p><strong>' +
                  data.user + ': </strong>' +
                  data.message +
                '</p>'
    return $('#chatbox').append(this.render)
  }
})
