$ ->
  PostsApp.PostsIndexView = Backbone.View.extend
    initialize: ->
      _.bindAll(this, 'addPost', 'addAllPost')
      PostsApp.Posts.on('add', this.addPost, this)
      PostsApp.Posts.on('reset', this.addAllPost, this)

    template:
      JST["templates/admin/posts/index"]

    render: ->
      this.$el.html(this.template())
      this

    addPost: (post) ->
      post_view = new PostsApp.PostView
        model: post

      this.$el.find('tbody').append(post_view.render().el)

    addAllPost: ->
      console.log PostsApp.Posts
      PostsApp.Posts.each(this.addPost)
