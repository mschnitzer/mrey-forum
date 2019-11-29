import consumer from "./consumer"

document.addEventListener("turbolinks:load", function() {
  $(document).ready(function() {
    consumer.subscriptions.create({ channel: "BoardTopicNotificationChannel", id: $('#board-topic-id').data('id') }, {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
      }
    });
  });
});
