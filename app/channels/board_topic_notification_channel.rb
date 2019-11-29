class BoardTopicNotificationChannel < ApplicationCable::Channel
  def subscribed
    board_topic = BoardTopic.find_by(id: params[:id])
    stream_for board_topic if board_topic
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
