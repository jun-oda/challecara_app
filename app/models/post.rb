class Post < ApplicationRecord
    after_create_commit do
      broadcast_prepend_to "post-list", target: "post-list-el", partial: "posts/post"
      broadcast_replace_to "post-info", target: "post-info-el", partial: "posts/info"
    end  
  end