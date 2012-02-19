PostsApp.Post = Backbone.Model.extend
  url: ->
    if this.id
      '/admin/posts/' + this.id
    else
      '/admin/posts'

PostsApp.PostCollection = Backbone.Collection.extend
  model: PostsApp.Post

  url: '/admin/posts'
