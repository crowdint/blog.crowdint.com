PostsApp.Post = Backbone.Model.extend
  url: ->
    if this.id
      'posts/' + this.id
    else
      'posts'

PostsApp.PostCollection = Backbone.Collection.extend
  model: PostsApp.Post

  url: 'posts'
