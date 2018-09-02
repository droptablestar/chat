App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: (data) => {
    let msg = '<p><strong>' + data.user + ': </strong>' +
                  data.message +
                '</p>';
    // clear the form
    $('#message_form').trigger('reset');
    return $('#chatbox').prepend(msg);
  }
})
