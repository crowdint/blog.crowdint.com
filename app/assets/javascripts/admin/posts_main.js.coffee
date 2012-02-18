$ ->
  PostsApp.Router = Backbone.Router.extend
    routes:
      "": "index"
      "new" : "newPost"

    newPost: ->
      new_posts = new PostsApp.NewPostView()
      $('#posts').html(new_posts.render().el)

    index: ->
      index_view = new PostsApp.PostsIndexView({posts: PostsApp.Posts.toJSON()})
      $('#posts').html(index_view.render().el)
      PostsApp.Posts.fetch()

  PostsApp.Posts = new PostsApp.PostCollection()

  PostsApp.PostsView = Backbone.View.extend
    el: $('#posts')

