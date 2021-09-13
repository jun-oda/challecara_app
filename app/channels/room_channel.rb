class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # app/assets/javascripts/channels/room.coffeeで定義した
  # speak関数によって、下記のspeakアクションが呼ばれます。
  def speak(data)
    message = Message.new(
                    content:          data['content'],
                    picture_data_uri: data['data_uri']
              )
    message.save
  end
end