App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: (data) => {
    var d = new Date(data.created_at);
    console.log(d);
    let msg = `<p>${d.getHours()}:${d.getMinutes()}:${d.getSeconds()} ` +
              `<strong>${data.user}: </strong>${data.message}</p>`
    // clear the form
    $('#message_form').trigger('reset');
    return $('#chatbox').prepend(msg);
  }
})
