$ ->
  PostsApp.Router = Backbone.Router.extend
    routes:
      "": "index"
      "new" : "newPost"
      "edit/:id" : "editPost"

    newPost: ->
      new_posts = new PostsApp.EditPostView({model: new PostsApp.Post() })
      $('#posts').html(new_posts.render().el)

    index: ->
      index_view = new PostsApp.PostsIndexView({posts: PostsApp.Posts.toJSON()})
      $('#posts').html(index_view.render().el)
      PostsApp.Posts.fetch()

    editPost: (e) ->
      post = PostsApp.Posts.get(e) || new PostsApp.Post({id: e, title: 'The title'})
      post.fetch
        success: (model) ->
          edit_post_view = new PostsApp.EditPostView({model: post})
          $('#posts').html(edit_post_view.render().el)

  PostsApp.Posts = new PostsApp.PostCollection()

  PostsApp.PostsView = Backbone.View.extend
    el: $('#posts')

