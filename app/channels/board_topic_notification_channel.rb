class BoardTopicNotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "board_topic_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
