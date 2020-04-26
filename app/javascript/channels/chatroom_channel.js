import consumer from "./consumer"

document.addEventListener("turbolinks:load", function() {
  if(document.getElementById('messages')) {
    const room_id = document.getElementById('messages').getAttribute('data-room-id');
    document.room = consumer.subscriptions.create({channel: "ChatroomChannel", room_id: room_id}, {
      connected() {
        // Called when the subscription is ready for use on the server
      },
      disconnected() {
        // Called when the subscription has been terminated by the server
      },
      received(data) {
        document.getElementById('messages').innerHTML += data.message;
      },
      send_message(msg) {
        this.perform('send_message', {
          message: msg
        });
      }
    });
    document.getElementById('send_box').addEventListener("keydown", function(event) {
      const key = event.keyCode || event.which
      if(key === 13) {
        document.room.send_message(event.target.value);
        event.target.value= '';
        event.preventDefault();
      }
    });
  }
});
