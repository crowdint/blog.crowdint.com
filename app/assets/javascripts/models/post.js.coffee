PostsApp.Post = Backbone.Model.extend()

PostsApp.PostCollection = Backbone.Collection.extend
  model: PostsApp.Post
  url: 'posts'
