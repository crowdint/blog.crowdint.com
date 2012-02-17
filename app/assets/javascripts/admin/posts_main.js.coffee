$ ->
  PostsApp.Router = Backbone.Router.extend
    routes:
      "": "index"
      "new" : "newPost"

    newPost: ->
      new_posts = new PostsApp.NewPostView()
      $('#posts').html(new_posts.render())


  PostsApp.PostsView = Backbone.View.extend
    el: $('#posts')

