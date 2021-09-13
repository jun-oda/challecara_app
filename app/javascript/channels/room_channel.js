var clear_form;

App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    return $('#messages').prepend(data['message_html']);
  },
  speak: function(content, data_uri, file_name) {
    this.perform('speak', {
      content: content,
      data_uri: data_uri,
      file_name: file_name
    });
    return clear_form('#test_form');
  }
});

clear_form = function(selector) {
  return $(selector).find(":text, :file").val("");
};

$(document).on('keypress', '#content', function(event) {
  var content, file_name, has_content, has_picture, picture, reader;
  if (event.which === 13) {
    content = $.trim($("#content").val());
    has_content = content.length > 0 ? true : false;
    picture = $('#picture');
    has_picture = picture.get(0).files.length > 0 ? true : false;
    if (has_content || has_picture) {
      if (has_picture) {
        file_name = picture.get(0).files[0].name;
        reader = new FileReader();
        reader.readAsDataURL(picture.get(0).files[0]);
        reader.addEventListener("loadend", function() {
          return App.room.speak(content, reader.result, file_name);
        });
      } else {
        App.room.speak(content);
      }
    }
    return event.preventDefault();
  }
});