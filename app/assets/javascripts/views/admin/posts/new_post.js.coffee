$ ->
  PostsApp.NewPostView = Backbone.View.extend
    template:
      JST['templates/admin/posts/new']

    render: ->
      this.template()
