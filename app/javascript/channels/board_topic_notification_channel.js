import consumer from "./consumer"

document.addEventListener("turbolinks:load", function() {
  $(document).ready(function() {
    consumer.subscriptions.create({ channel: "BoardTopicNotificationChannel", id: $('#board-topic-id').data('id') }, {
      connected() {
      },

      disconnected() {
      },

      received(data) {
        if (data['event'] === 'posts_updated') {
          $.get(data['query_path'], null, function(response) {
            $('#posts-list').html(response);
          });
        }
      }
    });
  });
});
