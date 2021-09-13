class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # room_channelに対して生成したデータをブロードキャストします。
    # ブロードキャストされたデータは 7. 送信・受信時の処理作成 の
    # received関数に渡されます。
    ActionCable.server.broadcast('room_channel', data(message))
  end

  private
    # ブロードキャストするデータを生成
    def data(message)
      {
        message_html:
        ApplicationController.renderer.render(
          partial: 'messages/message',
          locals: { message: message }
        )
      }
    end
end
