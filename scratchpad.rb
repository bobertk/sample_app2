Scratchpad

<%= link_to "delete post", micropost, method:  :delete,
                                     confirm: "You sure?",
                                     title:   micropost.content %>