$ ->
  PostsApp.PostsIndexView = Backbone.View.extend
    initialize: ->
      _.bindAll(this, 'addPost', 'addAllPosts', 'removePost')
      PostsApp.Posts.on('add', this.addPost, this)
      PostsApp.Posts.on('remove', this.removePost, this)
      PostsApp.Posts.on('reset', this.addAllPosts, this)

    template:
      JST["templates/admin/posts/index"]

    render: ->
      this.$el.html(this.template())
      this

    addPost: (post) ->
      elementId = 'post-' + post.id
      post_view = new PostsApp.PostView
        model: post
        id: elementId

      this.$el.find('tbody').append(post_view.render().el)

    addAllPosts: ->
      PostsApp.Posts.each(this.addPost)

    removePost: (post) ->
      this.$('#post-' + post.id).remove()
